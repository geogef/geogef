# frozen_string_literal: true

require 'spec_helper'
require 'support/data_setup'

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
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
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'Successful Authentication' do
    it 'logs in the user' do
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'Unsuccessful Authentication' do
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
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'GET /signup' do
    it 'renders the signup page for non-logged-in users' do
      get '/logout'
      get '/signup'

      expect(last_response).to be_ok
      expect(last_response.body).to include('Crear una cuenta')
    end

    it 'redirects logged-in users away from the signup page' do
      post '/login', email: 'test@example.com', password: 'password'
      get '/signup'

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods

  context 'POST /signup' do
    it 'renders the signup page again if any field is empty' do
      post '/signup', username: '', email: '', password: '', password_confirmation: ''

      expect(last_response).to be_ok
      expect(last_response.body).to include('Crear una cuenta')
      expect(last_response.body).to include('All fields are required.')
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
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
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'API Error Handling' do
    it 'returns 404 for non-existent QA correct answer' do
      get '/api/qa/999/correct_answer'
      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('QA record with ID 999 not found')
    end

    it 'returns an error if the exam is not found' do
      get '/api/exam/999/1'
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
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
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
      expect(last_response.body).to include('questions correctly')
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'GET /api/exam/:exam_id with correct and incorrect answers' do
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
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'GET /api/exam/:exam_id with user progress and levels' do
    it 'returns "No higher level found" if no more levels exist' do
      ProgressLesson.find_by(user: @user, lesson: @lesson).update(level: @level2)

      get "/api/exam/#{@exam2.id}/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('You have completed all lessons!')
    end

    it 'returns an error if progress is not found for the user and lesson' do
      ProgressLesson.find_by(user: @user, lesson: @lesson).destroy

      get "/api/exam/#{@exam1.id}/1"
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Progress not found for the current user and lesson.')
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods
  include DataSetup

  before(:each) do
    setup_test_data
  end

  context 'GET /api/qa/:qa_id/correct_answer' do
    it 'returns 404 if the question is not found for the QA record' do
      allow(Question).to receive(:find_by).with(id: @qa1.questions_id).and_return(nil)

      get "/api/qa/#{@qa1.id}/correct_answer"

      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq("Question not found for QA record with ID #{@qa1.id}")
    end

    it 'returns 404 if the correct answer is not found for the QA record' do
      allow(Option).to receive(:find_by).with(id: @qa1.options_id).and_return(nil)

      get "/api/qa/#{@qa1.id}/correct_answer"

      expect(last_response.status).to eq(404)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq("Correct answer not found for QA record with ID #{@qa1.id}")
    end
  end
end

describe 'Sinatra Project' do
  include Rack::Test::Methods, DataSetup

  before(:each) do
    setup_test_data
  end

  context 'POST /completed_lesson' do
    it 'returns success when marking a lesson as completed' do
      post '/completed_lesson', { lesson_id: @lesson.id, id: @user.id }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response).to be_ok
      data = JSON.parse(last_response.body)
      expect(data['message']).to eq('Lesson completed successfully!')
    end

    it 'returns an error if lesson ID is missing' do
      post '/completed_lesson', { lesson_id: nil, id: @user.id }.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(422)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Lesson ID is required')
    end

    it 'returns an error if JSON is invalid' do
      post '/completed_lesson', 'invalid json', { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(400)
      data = JSON.parse(last_response.body)
      expect(data['error']).to eq('Invalid JSON format')
    end
  end
end
