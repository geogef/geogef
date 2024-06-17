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
end

