require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

enable :sessions

USERS = {
  'test@test.com' => BCrypt::Password.create('password01'),
  'user2' => BCrypt::Password.create('password2')
}

get '/' do
  'Welcome to the login system!'
end

get '/login' do
  erb :login
end

post '/login' do
  username = params['email']
  password = params['password']

  if USERS.key?(username) && BCrypt::Password.new(USERS[username]) == password
    session[:username] = username
    redirect '/dashboard'
  else
    'Invalid username or password'
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

  if password == password_confirmation
    redirect '/login'
  else
    redirect '/signup'
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
