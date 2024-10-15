# frozen_string_literal: true

module AuthenticationHelpers
  def redirect_if_logged_in
    redirect '/dashboard' if session[:user_id]
  end

  def authenticate_user
    redirect '/login' unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
