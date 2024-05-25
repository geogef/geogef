require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'json'
require 'dotenv/load'

require './auth_middleware'
require './models/user.rb'
require './models/question.rb'
require './models/option.rb'
require './models/topic.rb'
require './models/qa.rb'

session_secret = ENV['SESSION_SECRET'] || 'default_secret'

enable :sessions
set :database_file, './config/database.yml'

use AuthMiddleware

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  password = params['password']

  user = User.find_by(email: email)

  if user && user.authenticate(password)
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    erb :login, locals: {
      error: 'Invalid username or password.'
    }
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  username = params['username']
  email = params['email']
  password = params['password']
  password_confirmation = params['password-confirmation']

  if username.empty? ||
     email.empty? ||
     password.empty? ||
     password_confirmation.empty?
    return erb :signup, locals: {
      error: 'All fields are required.'
    }
  end

  if User.find_by(username: username)
    return erb :signup, locals: {
      error: 'Username already exists.'
    }
  end

  if User.find_by(email: email)
    return erb :signup, locals: { 
      error: 'Another account with this email already exists'
    }
  end

  if password != password_confirmation
    return erb :signup, locals: {
      error: 'Passwords do not match.'
    }
  end

  user = User.create(username: username, email: email, password: password)

  if user.valid?
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    erb :signup, locals: {
      error: 'Failed to create user.'
    }
  end
end


get '/dashboard' do
  if session[:user_id]
    erb :dashboard
  else
    redirect '/login'
  end
end

get '/quiz' do
  erb :quiz
end


get '/logout' do
  session.clear
  redirect '/login'
end

get '/api/qa/:qa_id' do |qa_id|
  qa = Qa.find_by(id: qa_id)

  return { error: 'QA not found' }.to_json unless qa

  question = Question.find_by(id: qa.questions_id)
  correct_option = Option.find_by(id: qa.options_id)
  topic = question.topics_id

  incorrect_options = Option.where.not(id: correct_option.id).
                     where(topics_id: topic).order('RANDOM()').limit(3)

  question_data = {
    question: question.question,
    options: (incorrect_options.map(&:response) << correct_option.response)
              .shuffle,
    img: qa.imagepath
  }

  content_type :json
  question_data.to_json
end

get '/api/qa/:id/correct_answer' do
  content_type :json

  qa_id = params[:id]
  qa = Qa.find_by(id: qa_id)

  if qa.nil?
    status 404
    return { error: "QA record with ID #{qa_id} not found" }.to_json
  end

  question = Question.find_by(id: qa.questions_id)

  if question.nil?
    status 404
    return { 
      error: "Question not found for QA record with ID #{qa_id}"
    }.to_json
  end

  correct_answer = Option.find_by(id: qa.options_id)

  if correct_answer.nil?
    status 404
    return {
      error: "Correct answer not found for QA record with ID #{qa_id}"
    }.to_json
  end

  {
    question: question.question,
    correct_answer: correct_answer.response
  }.to_json
end
