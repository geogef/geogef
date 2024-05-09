require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true, format:
    { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

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

end
