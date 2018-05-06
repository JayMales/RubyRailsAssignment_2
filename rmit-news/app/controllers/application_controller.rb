class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # These are for every page to work out if you are logged in or not
  # Then it also gives you the object of the user when called
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

 # Sends you back to the login if you are not logged in
  def authorize
    redirect_to '/login' unless current_user
  end
end
