# frozen_string_literal: true

helpers do
  def redirect_if_logged_in
    redirect '/dashboard' if session[:user_id]
  end

  def authenticate_user
    redirect '/login' unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def level_completed?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress.is_completed || progress && progress.level.number > level_number
  end

  def level_unlocked?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress && progress.level.number >= level_number
  end

  def current_level?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress && progress.level.number == level_number
  end
end
