require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true, format:
    { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
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

  def init
    self.app_progress ||= 0.0
    self.highest_streak ||= 0
    self.completed_lessons ||= 0
    self.geogems ||= 0
  end

end
