helpers do
  def redirect_if_logged_in
    redirect '/dashboard' if session[:user_id]
  end

  def authenticate_user
    redirect '/login' unless session[:user_id]
  end
end
