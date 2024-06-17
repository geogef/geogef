require 'bcrypt'

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
    self.password == input_password
  end

  def update_streak(current_streak)
    self.update(current_streak: current_streak)
    if self.highest_streak < current_streak
      self.update(highest_streak: current_streak)
    end
  end

  def update_completed_lessons
    aux = self.completed_lessons + 1
    self.update(completed_lessons: aux)
  end

  def update_app_progress(total_lessons)
    progress = (self.completed_lessons.to_f / total_lessons.to_f) * 100
    self.update(app_progress: progress.round)
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
    public_user.id = self.id
    public_user.highest_streak = self.highest_streak
    public_user.current_streak = self.current_streak

    public_user
  end

  class PublicUser
    attr_accessor :id, :highest_streak, :current_streak
  end

end
