require 'spec_helper'

describe 'Sinatra Project' do
  include Rack::Test::Methods

  before(:each) do
    @user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
    @topic = Topic.create(topic: 'Geography')
    @lesson = Lesson.create(title: 'Lesson 1', description: 'A test lesson', num_levels: 2, topic: @topic)
    @level1 = Level.create(number: 1, name: 'Level 1', lesson: @lesson)
    @level2 = Level.create(number: 2, name: 'Level 2', lesson: @lesson)
    @exam1 = Exam.create(duration: 60, name: 'Exam 1', lesson: @lesson, level: @level1)
    @exam2 = Exam.create(duration: 60, name: 'Exam 2', lesson: @lesson, level: @level2)
    @question1 = Question.create(question: 'What is the capital of France?', topic: @topic)
    @question2 = Question.create(question: 'What is the capital of Germany?', topic: @topic)
    @option1 = Option.create(response: 'Paris', topics_id: @topic.id)
    @option2 = Option.create(response: 'Berlin', topics_id: @topic.id)
    @qa1 = Qa.create(questions_id: @question1.id, options_id: @option1.id, exam: @exam1)
    @qa2 = Qa.create(questions_id: @question2.id, options_id: @option2.id, exam: @exam2)
    ProgressLesson.create(user: @user, lesson: @lesson, level: @level1)

    post '/signup', username: @user.username, email: @user.email, password: 'password', 'password-confirmation': 'password'
    post '/login', email: @user.email, password: 'password'
  end

  context 'GET /' do
    it 'renders the index page with the correct layout' do
      get '/'

      expect(last_response).to be_ok
      expect(last_response.body).to include('Contacto')
      expect(last_response.body).to include('Donaciones')
      expect(last_response.body).to include('Ingresar')
    end
  end

  context 'Authentication' do
    it 'logs in the user' do
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end

  it 'renders the login page with an error message for invalid credentials' do
    post '/login', email: 'wrong@example.com', password: 'wrongpassword'

    expect(last_response).to be_ok
    expect(last_response.body).to include('Invalid username or password.')
  end

  it 'renders the login page with an error message when no credentials are provided' do
    post '/login', email: '', password: ''

    expect(last_response).to be_ok
    expect(last_response.body).to include('Invalid username or password.')
  end

    it 'prevents access to protected routes without login' do
      get '/logout'
      get '/dashboard'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
    end
  end

  context 'GET /signup' do
    it 'renders the signup page for non-logged-in users' do
      get '/logout'
      get '/signup'

      expect(last_response).to be_ok
      expect(last_response.body).to include('Crear una cuenta')
    end

    it 'redirects logged-in users away from the signup page' do
      # Mock a logged-in user
      post '/login', email: 'test@example.com', password: 'password'
      get '/signup'

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end
  end

  context 'Lesson progression' do
    it 'shows lessons and levels' do
      get '/lessons_levels'
      expect(last_response).to be_ok
      expect(last_response.body).to include(@lesson.title)
    end

    it 'prevents access to locked levels' do
      get "/lesson_levels/#{@lesson.id}/2"
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/lessons_levels')
    end
  end

  context 'API endpoints' do
    it 'fetches QA data' do
      get "/api/qa/#{@qa1.id}"
      expect(last_response).to be_ok
      data = JSON.parse(last_response.body)
      expect(data['question']).to eq(@question1.question)
    end

    it 'fetches correct answer for QA' do
      get "/api/qa/#{@qa1.id}/correct_answer"
      expect(last_response).to be_ok
      data = JSON.parse(last_response.body)
      expect(data['correct_answer']).to eq(@option1.response)
    end

    it 'fetches exam QA IDs' do
      get "/api/exam/#{@exam1.id}"
      expect(last_response).to be_ok
      data = JSON.parse(last_response.body)
      expect(data['qas']).to include(@qa1.id)
    end
  end

  context 'API Error Handling' do
    it 'returns 404 for non-existent QA' do
      get '/api/qa/999'
      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('QA not found')
    end

    it 'returns 404 for non-existent QA correct answer' do
      get '/api/qa/999/correct_answer'
      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('QA record with ID 999 not found')
    end

    it 'returns 404 for non-existent exam' do
      get '/api/exam/999'
      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Exam not found')
    end

    it 'returns an error if the exam is not found' do
      get "/api/exam/999/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Exam not found')
    end

    it 'returns 401 for unauthenticated access to API' do
      get '/logout'

      get "/api/qa/#{@qa1.id}"

      expect(last_response.status).to eq(401)
      expect(last_response.body).to include('Unauthorized')
    end
  end

  context 'GET /api/exam/:exam_id' do
    it 'returns 404 if exam has no associated QAs' do
      empty_exam = Exam.create(duration: 60, name: 'Empty Exam', lesson: @lesson, level: @level1)
      get "/api/exam/#{empty_exam.id}"
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('No QAs found for the exam')
    end
  end

  context 'GET /materials/:lesson_id/:level_id' do
    it 'returns 404 if no materials exist for given lesson and level' do
      get "/materials/#{@lesson.id}/#{@level1.id}"
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Materials not found')
    end
  end

  context 'GET /exam/:lesson_id/:level_id' do
    it 'redirects if the level is not unlocked' do
      get "/exam/#{@lesson.id}/#{@level2.id}"

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/lessons/levels')
    end

    it 'renders the exam page if the level is unlocked' do
      get "/exam/#{@lesson.id}/#{@level1.id}"

      expect(last_response).to be_ok
      expect(last_response.body).to include('Roman Empire Exam')
      expect(last_response.body).to include('Level 1')
    end

    it 'redirects if lesson_id is invalid' do
      get "/exam/999/#{@level1.id}"

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/lessons/levels')
    end

    it 'redirects if level_id is invalid' do
      get "/exam/#{@lesson.id}/999"

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/lessons/levels')
    end
  end

  context 'GET /api/exam/:exam_id/:correct_answers' do
    it 'returns "Not all answers are correct" when not all correct answers are given' do
      get "/api/exam/#{@exam1.id}/0"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('Not all answers are correct.')
    end

    it 'returns "Level up!" and progresses the user to the next level' do
      get "/api/exam/#{@exam1.id}/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('Level up!')
      expect(data['new_level']).to eq(@level2.name)
    end

    it 'returns "No higher level found" if no more levels exist' do
      ProgressLesson.find_by(user: @user, lesson: @lesson).update(level: @level2)

      get "/api/exam/#{@exam2.id}/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('No higher level found.')
    end

    it 'returns an error if progress is not found for the user and lesson' do
      ProgressLesson.find_by(user: @user, lesson: @lesson).destroy

      get "/api/exam/#{@exam1.id}/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Progress not found for the current user and lesson.')
    end

    it 'returns 404 if the question is not found for the QA record' do
      allow(Question).to receive(:find_by).with(id: @qa1.questions_id).and_return(nil)

      get "/api/qa/#{@qa1.id}/correct_answer"

      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq("Question not found for QA record with ID #{@valid_qa.id}")
    end

    it 'returns 404 if the correct answer is not found for the QA record' do
      allow(Option).to receive(:find_by).with(id: @qa1.options_id).and_return(nil)

      get "/api/qa/#{@qa1.id}/correct_answer"

      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq("Correct answer not found for QA record with ID #{@valid_qa.id}")
    end

    it 'returns an error when progress is not found for the current user and lesson' do
      ProgressLesson.where(user: @user, lesson: @exam.lesson).destroy_all

      get "/api/exam/#{@exam.id}/#{@exam.qas.count}"

      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Progress not found for the current user and lesson.')
    end

    it 'returns "You have completed all lessons!" if the user has completed all lessons' do
      # Simulate completing the exam with the correct number of answers
      allow(Qa).to receive(:where).with(exam_id: @exam1.id).and_return(double(pluck: [@qa1.id]))

      # Set the correct number of answers to match the total questions
      correct_answers = 3
      next_level = Level.create(number: 2, lesson: @lesson)

      # Simulate the next level being available
      allow(Level).to receive(:find_by).with(number: 2, lesson: @lesson).and_return(next_level)

      get "/api/exam/#{@exam1.id}/#{correct_answers}"

      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('You have completed all lessons!')
    end

    it 'returns "Error" if there is an issue processing the level update' do
      # Simulate a scenario where the next level is not found
      allow(Qa).to receive(:where).with(exam_id: @exam1.id).and_return(double(pluck: [@qa1.id]))
      correct_answers = 3

      # Simulate the next level not being available
      allow(Level).to receive(:find_by).with(number: 2, lesson: @lesson).and_return(nil)

      get "/api/exam/#{@exam1.id}/#{correct_answers}"

      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('Error')
    end
  end


  context 'POST /completed_lesson' do
    before(:each) do
      allow_any_instance_of(User).to receive(:update_completed_lessons).and_return(true)
      allow_any_instance_of(User).to receive(:update_app_progress).and_return(true)

      post '/login', email: @user.email, password: 'password'
    end

    it 'successfully completes a lesson and updates progress' do
      total_levels = Level.count

      post '/completed_lesson', { id: @user.id }.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response).to be_ok
      expect(@user).to have_received(:update_completed_lessons)
      expect(@user).to have_received(:update_app_progress).with(total_levels)
    end

    it 'returns 404 if user is not found' do
      post '/completed_lesson', { id: 9999 }.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('User not found')
    end

    it 'returns 400 if user ID is not provided' do
      post '/completed_lesson', {}.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('User ID is required')
    end

    it 'returns an error if lesson is already completed' do
      ProgressLesson.create(user: @user, lesson: @lesson, level: @level1)
      post '/completed_lesson', { id: @user.id }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('Lesson already completed')
    end

  end

  context 'GET /profile' do
    it 'shows user profile page' do
      get '/profile'
      expect(last_response).to be_ok
      expect(last_response.body).to include(@user.username)
    end

    it 'redirects to login if not authenticated' do
      get '/logout'
      get '/profile'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
    end
  end

  context 'POST /update_streak' do
    it 'successfully updates streak' do
      post '/update_streak', { id: @user.id, current_streak: 5 }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response).to be_ok
      @user.reload
      expect(@user.streak).to eq(5)
    end

    it 'returns 404 if user is not found' do
      post '/update_streak', { id: 9999, current_streak: 5 }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('User not found')
    end

    it 'returns 400 if streak is not provided' do
      post '/update_streak', { id: @user.id }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('Current streak is required')
    end
  end

  context 'GET /leaderboard' do
    it 'shows the leaderboard with users sorted by highest streak' do
      User.create(username: 'anotheruser', email: 'another@example.com', password: 'password', highest_streak: 10)
      get '/leaderboard'
      expect(last_response).to be_ok
      expect(last_response.body).to include(@user.username)
      expect(last_response.body).to include('anotheruser')
    end
  end

  context 'GET /materials/:lesson_id/:level_id' do
    it 'shows materials for a lesson and level' do
      Material.create(level: @level1, content: 'Material 1')
      get "/materials/#{@lesson.id}/#{@level1.id}"
      expect(last_response).to be_ok
      expect(last_response.body).to include('Material 1')
    end

    it 'returns 404 if lesson_id or level_id is invalid' do
      get "/materials/999/999"
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Materials not found')
    end

    it 'returns 404 if no materials exist for the given lesson and level' do
      get "/materials/#{@lesson.id}/#{@level1.id}"
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Materials not found')
    end
  end

  context 'GET /logout' do
    it 'clears session and redirects to login' do
      get '/logout'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
      expect(session[:user_id]).to be_nil # Verifica que la sesión se ha borrado
    end
  end

  context 'GET /leaderboard' do
    it 'shows leaderboard even when no users have streaks' do
      User.delete_all # Clear users
      get '/leaderboard'
      expect(last_response).to be_ok
      expect(last_response.body).to include('No users found') # Adjust based on actual behavior if no users are present
    end
  end

  context 'GET /profile' do
    it 'redirects to login if not authenticated' do
      get '/logout'
      get '/profile'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
    end
  end

  context 'POST /completed_lesson' do
    it 'successfully updates lesson progress' do
      post '/completed_lesson', { id: @user.id }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response).to be_ok
      @user.reload
      expect(@user.completed_lessons).to include(@lesson) # Verificar que la lección se marcó como completada
    end
  end

  context 'POST /update_streak' do
    it 'returns error if user ID is missing' do
      post '/update_streak', { current_streak: 5 }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('User ID is required')
    end
  end

  context 'GET /api/exam/:exam_id/:correct_answers' do
    it 'returns "Not all answers are correct" when correct_answers is less than total questions' do
      get "/api/exam/#{@exam1.id}/0"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('Not all answers are correct.')
      expect(data['qas']).to include(@qa1.id)
    end
  end

  context 'GET /materials/:lesson_id/:level_id' do
    it 'returns 404 if no materials exist for given lesson and level' do
      get "/materials/#{@lesson.id}/#{@level1.id}"
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Materials not found')
    end
  end

  context 'GET /lessons/levels' do
    it 'initializes progress for all lessons if none exists' do
      ProgressLesson.destroy_all # Clear existing progress
      get '/lessons/levels'
      expect(last_response).to be_ok
      expect(ProgressLesson.count).to eq(Lesson.count) # Verify progress records are created
    end
  end

  context 'POST /signup' do
    before(:each) do
      get '/logout'
      @valid_username = 'newuser'
      @valid_email = 'newuser@example.com'
      @valid_password = 'password'
      @valid_password_confirmation = 'password'
    end

  it 'creates a new user and redirects to the dashboard with valid inputs' do
    post '/signup', username: @valid_username, email: @valid_email, password: @valid_password, 'password-confirmation': @valid_password_confirmation

    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.path).to eq('/dashboard')
    expect(session[:user_id]).not_to be_nil
  end

    it 'returns error if passwords do not match' do
      post '/signup', username: 'newuser', email: 'new@example.com', password: 'password1', 'password-confirmation': 'password2'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Passwords do not match.')
    end

    it 'returns error if any field is empty' do
      post '/signup', username: '', email: '', password: '', 'password-confirmation': ''
      expect(last_response).to be_ok
      expect(last_response.body).to include('All fields are required.')
    end

    it 'returns error if username is already taken' do
      post '/signup', username: 'existinguser', email: 'new@example.com', password: 'password', 'password-confirmation': 'password'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Username already exists.')
    end

    it 'returns error if email is already taken' do
      post '/signup', username: 'anotheruser', email: 'test@example.com', password: 'password', 'password-confirmation': 'password'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Another account with this email already exists')
    end

    it 'returns error if email is not actually an email' do
      post '/signup', username: 'anotheruser', email: 'test', password: 'password', 'password-confirmation': 'password'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Failed to create user.')
    end
  end

  context 'GET /lessons/levels/:lesson_id/:level' do
    it 'renders the level page if the level is unlocked' do
      get "/lessons/levels/#{@lesson.id}/#{@level1.number}"

      expect(last_response).to be_ok
      expect(last_response.body).to include('Algebra Basics')
      expect(last_response.body).to include('Level 1')
    end

    it 'redirects if the level is not unlocked' do
      get "/lessons/levels/#{@lesson.id}/#{@level2.number}"

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/lessons/levels')
      expect(last_response.body).to include('You have not unlocked this level yet.')
    end

    it 'returns 404 if lesson_id is invalid' do
      get "/lessons/levels/999/#{@level1.number}"

      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Not Found')
    end

    it 'returns 404 if level is invalid' do
      get "/lessons/levels/#{@lesson.id}/999"

      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Not Found')
    end

    it 'returns 404 if level_id does not belong to the lesson' do
      get "/lessons/levels/#{@lesson.id}/#{@level1.number + 100}"

      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Not Found')
    end
  end

  context 'GET /quiz/:exam_id' do
    before(:each) do
      @valid_exam_id = @exam1.id
      @invalid_exam_id = 9999
    end

    it 'renders the quiz page for a valid exam ID' do
      get "/quiz/#{@valid_exam_id}"
      
      expect(last_response).to be_ok
      expect(last_response.body).to include('Quiz Page')
      expect(last_response.body).to include('Exam 1')
    end

    it 'returns 404 if the exam ID is invalid' do
      get "/quiz/#{@invalid_exam_id}"
      
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Exam not found')
    end
  end

  context 'GET /lessons' do
    before(:each) do
      @lesson1 = Lesson.create(title: 'Lesson 1', description: 'Description for Lesson 1', num_levels: 3)
      @lesson2 = Lesson.create(title: 'Lesson 2', description: 'Description for Lesson 2', num_levels: 2)
    end

    it 'renders the lessons page with lessons' do
      get '/lessons'

      expect(last_response).to be_ok
      expect(last_response.body).to include(@lesson1.title)
      expect(last_response.body).to include(@lesson2.title)
      expect(last_response.body).to include(@lesson1.description)
      expect(last_response.body).to include(@lesson2.description)
    end

    it 'renders the lessons page with no lessons' do
      Lesson.delete_all

      get '/lessons'

      expect(last_response).to be_ok
      expect(last_response.body).to include('No lessons available')
    end
  end

end
