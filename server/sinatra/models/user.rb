# frozen_string_literal: true

require 'bcrypt'

# User model
class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true, format:
    { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :progress_lessons
  after_initialize :init

  def password
    @password ||= Password.new(self[:password])
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self[:password] = @password
  end

  def authenticate(input_password)
    password == input_password
  end

  def modify_gems(amount)
    aux = geogems + amount
    update(geogems: aux)
  end

  def update_streak(current_streak)
    modify_gems(5) if current_streak != 0 && (current_streak % 10).zero?

    update(current_streak: current_streak)
    return unless highest_streak < current_streak

    update(highest_streak: current_streak)
  end

  def update_completed_lessons
    aux = completed_lessons + 1
    modify_gems(3)
    update(completed_lessons: aux)
  end

  def update_app_progress(total_lessons)
    progress = (completed_lessons.to_f / total_lessons) * 100
    update(app_progress: progress.round)
  end

  def admin?
    user_type == 1
  end

  def init
    self.app_progress ||= 0.0
    self.highest_streak ||= 0
    self.current_streak ||= 0
    self.completed_lessons ||= 0
    self.geogems ||= 0
  end

  def public_data
    public_user = PublicUser.new
    public_user.id = id
    public_user.highest_streak = self.highest_streak
    public_user.current_streak = self.current_streak

    public_user
  end

  # public data of user model
  class PublicUser
    attr_accessor :id, :highest_streak, :current_streak
  end
end
