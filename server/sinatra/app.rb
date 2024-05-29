require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'json'
require 'dotenv/load'

require './auth_middleware'
require './helpers'
require './models/user.rb'
require './models/question.rb'
require './models/option.rb'
require './models/topic.rb'
require './models/lesson.rb'
require './models/qa.rb'
require './models/exam.rb'
require './models/progresslesson'
require './models/level'
require './models/material'

session_secret = ENV['SESSION_SECRET'] || 'default_secret'

enable :sessions
set :database_file, './config/database.yml'

use AuthMiddleware

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def level_unlocked?(lesson, level)
    # El primer nivel siempre está desbloqueado
    return true if level == 1

    # Verifica si el usuario ha completado el examen del nivel anterior
    previous_level = Level.find_by(number: level - 1)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson, level: previous_level)
    progress && progress.passed_exam?
  end
  
end



get '/' do
  erb :index
end

get '/login' do
  redirect_if_logged_in
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
  redirect_if_logged_in
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
  authenticate_user
  erb :dashboard
end

get '/geoglifos' do
  erb :geoglifos
end

get '/lessons_details' do
  @lessons = Lesson.all
  erb :lessons_details
end

get '/lessons_levels' do
  @lessons = Lesson.all
  erb :lessons_levels
end

get '/lesson_levels/:lesson_id/:level' do
  @lesson = Lesson.find(params[:lesson_id])
  @level = Level.find_by(number: params[:level])
  @exam = Exam.find_by(lesson_id: @lesson.id, level: @level)

  if !level_unlocked?(@lesson, @level.number)
    redirect '/lessons_levels', error: "You have not unlocked this level yet."
  else
    erb :level
  end
end

get '/lessons_levels/:lesson_id/levels/:level_id' do
  @lesson = Lesson.find(params[:lesson_id])
  @level = Level.find(params[:level_id])
  erb :'level'
end

get '/lesson_level/:lesson_id/:level_id' do
  authenticate_user

  lesson_id = params[:lesson_id]
  level_id = params[:level_id]

  lesson = Lesson.find_by(id: lesson_id)
  level = Level.find_by(id: level_id)

  if lesson && level
    erb :level, locals: { lesson: lesson, level: level }
  else
    redirect '/lessons_levels', error: "Lesson or level not found."
  end
end

get '/lessons/:lesson_id/levels/:level_id/materials' do |lesson_id, level_id|
  @lesson = Lesson.find(lesson_id)
  @level = Level.find(level_id)
  @materials = Material.where(level_id: level_id)
  erb :materials, locals: { lesson: @lesson, level: @level, materials: @materials }
end

get '/lessons/:lesson_id/levels/:level_id/quiz' do |lesson_id, level_id|
  @lesson = Lesson.find(lesson_id)
  @level = Level.find(level_id)
  @exam = Exam.find_by(lesson_id: @lesson.id, level_id: @level.id)
  erb :quiz, locals: { lesson: @lesson, level: @level, exam: @exam }
end

get '/exam' do
  @exam_id = params[:exam_id] 
  authenticate_user
  erb :quiz 
end


get '/quiz/:exam_id' do
  @exam_id = params[:exam_id]
  authenticate_user
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

get '/api/exam/:exam_id' do |exam_id|
  exam = Exam.find_by(id: exam_id)
  return { error: 'Exam not found' }.to_json unless exam

  qas = Qa.where(exam_id: exam_id).pluck(:id)
  { qas: qas }.to_json
end

get '/api/exam/:exam_id/:correct_answers' do |exam_id, correct_answers|
  exam = Exam.find_by(id: exam_id)
  return { error: 'Exam not found' }.to_json unless exam

  qas = Qa.where(exam_id: exam_id).pluck(:id)
  total_questions = qas.length

  if correct_answers.to_i == total_questions
    lesson = exam.lesson
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)

    if progress
      current_level_number = progress.level.number
      next_level = Level.find_by(number: current_level_number + 1)

      if next_level
        progress.update(level: next_level)
        return { message: 'Level up!', new_level: next_level.name, qas: qas }.to_json
      else
        return { message: 'No higher level found.', qas: qas }.to_json
      end
    else
      return { error: 'Progress not found for the current user and lesson.' }.to_json
    end
  else
    return { message: 'Not all answers are correct.', qas: qas }.to_json
  end
end
