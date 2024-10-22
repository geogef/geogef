# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require_relative '../config/environment'
require_relative '../models/user'
require 'rspec'
require 'rack/test'

# Email Validations
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'email validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a unique email' do
      User.create(email: 'test@example.com', username: 'testuser1', password: 'password123')
      expect(user).to_not be_valid
    end

    it 'is not valid with an invalid email format' do
      user.email = 'invalid_email'
      expect(user).to_not be_valid
    end
  end
end

# Username Validations
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'username validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a unique username' do
      User.create(email: 'test2@example.com', username: 'testuser', password: 'password123')
      expect(user).to_not be_valid
    end
  end
end

# Password Encryption
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'password encryption' do
    it 'encrypts the password' do
      user.save
      expect(user.authenticate('password123')).to be_truthy
    end
  end

  describe '#authenticate' do
    it 'returns true for a valid password' do
      user.password = 'password123'
      user.save
      expect(user.authenticate('password123')).to be_truthy
    end

    it 'returns false for an invalid password' do
      user.password = 'password123'
      user.save
      expect(user.authenticate('wrongpassword')).to be_falsey
    end
  end
end

# Streaks
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'streak updates' do
    before do
      user.save
    end

    it 'updates the current streak' do
      user.update_streak(5)
      expect(user.current_streak).to eq(5)
    end

    it 'updates the highest streak if current streak is higher' do
      user.highest_streak = 4
      user.update_streak(5)
      expect(user.highest_streak).to eq(5)
    end

    it 'does not update the highest streak if current streak is lower' do
      user.update_streak(5)
      user.update_streak(3)
      expect(user.highest_streak).to eq(5)
    end
  end
end

# Completed Lessons
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe '#update_completed_lessons' do
    before do
      user.save
    end

    it 'increments the completed lessons count' do
      expect { user.update_completed_lessons }.to change { user.completed_lessons }.by(1)
    end
  end
end

# App Progress
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe '#update_app_progress' do
    before do
      user.save
      user.update(completed_lessons: 5)
    end

    it 'updates the app progress percentage' do
      user.update_app_progress(10)
      expect(user.app_progress).to eq(50)
    end
  end
end

# Initialization
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'initialization' do
    it 'initializes with default values' do
      user = User.new
      expect(user.app_progress).to eq(0.0)
      expect(user.highest_streak).to eq(0)
      expect(user.current_streak).to eq(0)
      expect(user.completed_lessons).to eq(0)
      expect(user.geogems).to eq(0)
    end
  end
end

# Public Data
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe '#public_data' do
    before do
      user.save
    end

    it 'returns a public user with id, highest_streak, and current_streak' do
      public_user = user.public_data
      expect(public_user.id).to eq(user.id)
      expect(public_user.highest_streak).to eq(user.highest_streak)
      expect(public_user.current_streak).to eq(user.current_streak)
    end
  end
end

# Geogems
RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password123') }

  describe 'update geogems value' do
    before do
      user.save
    end

    it 'user wins 3 gems after completing a lesson' do
      expect { user.update_completed_lessons }.to change { user.geogems }.by(3)
    end

    it 'user earns 5 gems for every streak of 10' do
      expect { user.update_streak(10) }.to change { user.geogems }.by(5)
    end
  end
end
