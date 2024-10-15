require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'json'
require 'dotenv/load'
require 'fileutils'


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
    user.update(last_connection: Time.now)
    redirect '/dashboard'
  else
    erb :login, layout: :login, locals: {
      error: 'Invalid username or password.'
    }
  end
end

get '/signup' do
  redirect_if_logged_in
  erb :signup, layout: :signup
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
    return erb :signup, layout: :signup, locals: {
      error: 'All fields are required.'
    }
  end

  if User.find_by(username: username)
    return erb :signup, layout: :signup, locals: {
      error: 'Username already exists.'
    }
  end

  if User.find_by(email: email)
    return erb :signup, layout: :signup, locals: {
      error: 'Another account with this email already exists'
    }
  end

  if password != password_confirmation
    return erb :signup, layout: :signup, locals: {
      error: 'Passwords do not match.'
    }
  end

  user = User.create(username: username, email: email, password: password, last_connection: Time.now)

  if user.valid?
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    erb :signup, layout: :signup, locals: {
      error: 'Failed to create user.'
    }
  end
end


get '/dashboard' do
  @countries_data = Country.all
  erb :dashboard
end

get '/lessons' do
  @lessons = Lesson.all
  erb :lessons_details
end

get '/lessons/levels' do
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

get '/lessons/levels/:lesson_id/:level' do
  @lesson = Lesson.find(params[:lesson_id])
  @level = Level.find_by(number: params[:level], lesson: @lesson)
  @exam = Exam.find_by(lesson_id: @lesson.id, level: @level)

  if !level_unlocked?(@lesson, @level.number)
    redirect '/lessons/levels', error: "You have not unlocked this level yet."
  else
    erb :level
  end
end

get '/materials/:lesson_id/:level_id' do |lesson_id, level_id|
  @lesson = Lesson.find(lesson_id)
  @level = Level.find(level_id)
  @materials = Material.where(level_id: level_id)
  erb :materials, locals: { lesson: @lesson, level: @level, materials: @materials }
end

get '/exam/:lesson_id/:level_id' do |lesson_id, level_id|
  @publicUser = current_user.public_data
  @lesson = Lesson.find(lesson_id)
  @level = Level.find(level_id)
  @lesson_id = params[:lesson_id]
  @level_id = params[:level_id]
  if not level_unlocked?(@lesson, @level.number)
    redirect '/lessons/levels'
  end
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

post '/api/reward/1/:qa_id' do
  content_type :json
  authenticate_user

  qa = Qa.find_by(id: params[:qa_id])
  return { error: 'QA not found' }.to_json unless qa

  correct_option = Option.find_by(id: qa.options_id)
  return { error: 'Correct option not found' }.to_json unless correct_option

  question = Question.find_by(id: qa.questions_id)
  topic = question.topic_id

  data = JSON.parse(request.body.read)
  displayed_options = data['options']

  if displayed_options.nil? || displayed_options.length != 4
    return { error: 'Exactly 4 options must be provided.' }.to_json
  end

  incorrect_options = displayed_options.reject { |opt| opt == correct_option.response }
  incorrect_option = incorrect_options.sample

  options_to_keep = [correct_option.response, incorrect_option].shuffle

  user = current_user
  geogem_cost = 5
  if user.geogems < geogem_cost
    return { error: 'Not enough Gems to remove options.' }.to_json
  end

  user.update(geogems: user.geogems - geogem_cost)

  {
    options_to_keep: options_to_keep
  }.to_json
end

get '/api/reward/2/' do
  content_type :json
  authenticate_user

  user = current_user
  geogem_cost = 3
  if user.geogems < geogem_cost
    return { error: 'Not enough Geogems.' }.to_json
  end

  user.update(geogems: user.geogems - geogem_cost)

  {
    seconds_added: 30,
    message: "Seconds have been added correctly.",
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
      if exam.level.number == current_level_number
        next_level = Level.find_by(number: current_level_number + 1, lesson: lesson)

        if next_level
          progress.update(level: next_level)
          return { message: 'Level up!', new_level: next_level.name }.to_json
        else
          progress.update(is_completed: true)
          return { message: 'You have completed all lessons!' }.to_json
        end
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

before '/admin' do
  redirect '/login' unless session[:user_id]
  
  user = User.find(session[:user_id])
  
  if user.user_type != 1
    halt 403, "No tienes permiso para acceder a esta página."
  end
end

get '/admin' do
  erb :admin
end

get '/view_users' do
  @users = User.all
  erb :view_users
end

get '/admin/query' do
  @type = params[:type]

  if @type == 'correctly'
    @questions = Question.all.sort_by { |question| -question.correct_answers_count }
  elsif @type == 'incorrectly'
    @questions = Question.all.sort_by { |question| -question.incorrect_answers_count }
  else
    @questions = []
  end

  @count = params[:n].to_i

  @questions = @questions.first(@count)

  erb :admin_query
end

get '/admin/questions/:id/edit' do
  authenticate_user
  question = Question.find_by(id: params[:id])

  if current_user.admin? && question
    erb :edit_question, locals: { question: question }
  else
    halt 403, 'Access denied.'
  end
end

post '/admin/questions/:id' do
  question = Question.find_by(id: params[:id])

  if current_user.admin? && question
    question_text = params['question']
    topic_id = params['topic_id']

    if question.update(question: question_text, topic_id: topic_id)
      redirect '/admin/qas'
    else
      erb :edit_question, locals: { question: question, error: 'Failed to update question.' }
    end
  else
    halt 403, 'Access denied.'
  end
end

before '/admin' do
  redirect '/login' unless session[:user_id]

  user = User.find(session[:user_id])

  if user.user_type != 1
    halt 403, "No tienes permiso para acceder a esta página."
  end
end

get '/admin' do
  erb :admin
end

post '/admin/promote' do
  authenticate_user

  halt 403, { error: 'Access denied.' } unless current_user.admin?

  user_id = params[:user_id]

  user = User.find_by(id: user_id)

  if user.nil?
    session[:message] = 'User not found.'
  else
    user.update(user_type: 1)
    if user.save
      session[:message] = "El usuario #{user.username} ha sido promovido a admin."
    else
      session[:message] = 'Error al promover usuario a admmin.'
    end
  end

  redirect '/view_users'
end

get '/admin/questions/new' do
  halt 403, 'Access denied.' unless current_user.admin?

  @topics = Topic.all
  erb :new_question
end

post '/admin/questions' do
  halt 403, 'Access denied.' unless current_user.admin?

  question_text = params['question']
  correct_answer_text = params['correct_answer']
  question_level = params['question_level']
  topic_id = params['topic_id']
  
  if topic_id.nil?
      redirect '/admin/questions/new'
  end

  lesson = Lesson.find_by(topic_id: topic_id)
  level = Level.find_by(lesson_id: lesson.id, number: question_level)
  imagepath = nil

  if level.nil?
    @topics = Topic.all
    return erb :new_question, locals: { error: 'Failed to create question.' }
  end

  exam = Exam.find_by(lesson_id: lesson.id, level: level.id)


  question = Question.new(question: question_text, topic_id: topic_id)

  puts params['image']

  if Topic.find(topic_id).topic == 'Banderas' && params['image'][:filename].end_with?('.svg')
    filename = params['image'][:filename]
    file = params['image'][:tempfile]
    
    image_folder = "./public/images/flags"

    filepath = "#{image_folder}/#{filename}"
    File.open(filepath, 'wb') do |f|
      f.write(file.read)
    end

    imagepath = "images/flags/#{filename}"
  end


  if question.save
    correct_option = Option.create(response: correct_answer_text, topics_id: topic_id)

    if correct_option.save
      if imagepath.nil?
        Qa.create(questions_id: question.id, options_id: correct_option.id, exam_id: exam.id)
      else
        Qa.create(questions_id: question.id, options_id: correct_option.id, exam_id: exam.id, imagepath: imagepath)
      end

      redirect '/admin'
    end
  else
    @topics = Topic.all
    return erb :new_question, locals: { error: 'Failed to create question.' }
  end
end

get '/admin/qas' do
  @qas = Qa.includes(:question, :option).all
  erb :qas
end
