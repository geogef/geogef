require_relative '../app'
require 'rack/test'
require 'rspec'

describe 'Helpers' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before do
    @user = User.create(username: 'testuser', password: 'password')
    @lesson = Lesson.create(name: 'Lesson 1')
    @level1 = Level.create(number: 1, lesson: @lesson)
    @level2 = Level.create(number: 2, lesson: @lesson)
    @progress = ProgressLesson.create(user: @user, lesson: @lesson, level: @level1)
  end

  after do
    # Clean after test
    User.delete_all
    Lesson.delete_all
    Level.delete_all
    ProgressLesson.delete_all
  end

  context 'redirect_if_logged_in' do
    it 'redirects to dashboard if user is logged in' do
      post '/login', { username: 'testuser', password: 'password' }
      get '/some_protected_route'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/dashboard')
    end

    it 'does not redirect if user is not logged in' do
      get '/some_protected_route'
      expect(last_response).not_to be_redirect
    end
  end

  context 'authenticate_user' do
    it 'redirects to login if user is not authenticated' do
      get '/some_protected_route'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/login')
    end

    it 'does not redirect if user is authenticated' do
      post '/login', { username: 'testuser', password: 'password' }
      get '/some_protected_route'
      expect(last_response).not_to be_redirect
    end
  end

  context 'current_user' do
    it 'returns the current user if logged in' do
      post '/login', { username: 'testuser', password: 'password' }
      expect(current_user).to eq(@user)
    end

    it 'returns nil if no user is logged in' do
      expect(current_user).to be_nil
    end
  end

  context 'level_completed?' do
    it 'returns true if the user has completed the level' do
      @progress.update(level: @level2)
      expect(level_completed?(@lesson, 1)).to be true
    end

    it 'returns false if the user has not completed the level' do
      expect(level_completed?(@lesson, 2)).to be false
    end

    it 'returns false if progress is nil' do
      ProgressLesson.delete_all
      expect(level_completed?(@lesson, 1)).to be false
    end
  end

  context 'level_unlocked?' do
    it 'returns true if the level is unlocked' do
      @progress.update(level: @level1)
      expect(level_unlocked?(@lesson, 1)).to be true
    end

    it 'returns false if the level is not unlocked' do
      expect(level_unlocked?(@lesson, 2)).to be false
    end

    it 'returns false if progress is nil' do
      ProgressLesson.delete_all
      expect(level_unlocked?(@lesson, 1)).to be false
    end
  end

  context 'current_level?' do
    it 'returns true if it is the current level' do
      @progress.update(level: @level1)
      expect(current_level?(@lesson, 1)).to be true
    end

    it 'returns false if it is not the current level' do
      expect(current_level?(@lesson, 2)).to be false
    end

    it 'returns false if progress is nil' do
      ProgressLesson.delete_all
      expect(current_level?(@lesson, 1)).to be false
    end
  end
end
