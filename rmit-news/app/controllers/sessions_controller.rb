class SessionsController < ApplicationController

  # This controller is for the session for login

  def new
  end

  # Checks if user is in database and if password is matchers
  # Creates session with user Id and then redirects you to root
  # or if fails puts you back at login.
  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  # This is basically logout. Sets session to nil, then sends you to login
  def destroy
    if session[:user_id] != nil
      session[:user_id] = nil
    end
    redirect_to '/login'
  end
end
