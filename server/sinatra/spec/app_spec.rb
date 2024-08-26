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

  context 'Authentication' do
    it 'logs in the user' do
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end

    it 'prevents access to protected routes without login' do
      get '/logout'
      get '/dashboard'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
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
  end

end

