require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'json'
require 'dotenv/load'


require './auth_middleware'
require './helpers'
require './models/user'
require './models/question'
require './models/option'
require './models/topic'
require './models/lesson'
require './models/qa'
require './models/exam'
require './models/progresslesson'
require './models/level'
require './models/material'
require './models/country'

enable :sessions
set :database_file, './config/database.yml'

use AuthMiddleware

session_secret = ENV['SESSION_SECRET'] || 'default_secret'

# Callback before for protected endpoints
before do
  unless request.path_info =~ /^\/(login|signup|api|assets|)$/
    authenticate_user
  end
end

get '/' do
  erb :index, layout: :index
end

get '/login' do
  redirect_if_logged_in
  erb :login, layout: :login
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
  @countries_data = Country.all
  erb :dashboard
end

get '/lessons_details' do
  @lessons = Lesson.all
  erb :lessons_details
end

get '/lessons_levels' do
  authenticate_user
    if session[:user_id]
      @lessons = Lesson.all
      unless current_user.progress_lessons.exists?
        Lesson.all.each do |lesson|
          level = Level.find_by(number: 1, lesson: lesson)
          ProgressLesson.create(user: current_user, lesson: lesson, level: level)
        end
      end
      erb :lessons_levels
    end
end

get '/lesson_levels/:lesson_id/:level' do
  @lesson = Lesson.find(params[:lesson_id])
  @level = Level.find_by(number: params[:level], lesson: @lesson)
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

get '/lesson_level/:lesson_id/:level_number' do
  lesson_id = params[:lesson_id]
  level_number = params[:level_number]

  lesson = Lesson.find(lesson_id)
  level = Level.find_by(number: level_number, lesson: lesson)

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

get '/lessons/:lesson_id/levels/:level_id/exam' do |lesson_id, level_id|
  @publicUser = current_user.public_data
  @lesson = Lesson.find(lesson_id)
  @level = Level.find(level_id)
  @exam_id = Exam.find_by(lesson: @lesson, level: @level).id

  erb :quiz, locals: { lesson: @lesson, level: @level, exam: @exam}
end


get '/profile' do
  @user = current_user
  erb :profile
end


get '/quiz/:exam_id' do
  @exam_id = params[:exam_id]
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
  topic = question.topic_id

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
      next_level = Level.find_by(number: current_level_number + 1, lesson: lesson)

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

post '/update_streak' do
  content_type :json

  data = JSON.parse(request.body.read)
  user_id = data['id']
  user_current_streak = data['current_streak']

  user = User.find(user_id)
  user.update_streak(user_current_streak)
end

post '/completed_lesson' do
  content_type :json

  data = JSON.parse(request.body.read)
  user_id = data ['id']

  user = User.find(user_id)
  user.update_completed_lessons

  total_levels = Level.count
  user.update_app_progress(total_levels)
end

get '/leaderboard' do
  @users = User.all.sort_by { |user| -user.highest_streak }
  erb :ranking
end
