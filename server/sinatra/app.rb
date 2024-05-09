require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

require './models/user.rb'

enable :sessions
set :database_file, './config/database.yml'

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
    session[:username] = email
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
  if session[:username]
    erb :dashboard
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end

