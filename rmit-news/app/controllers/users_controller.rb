class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
  end



  # This is the signup page. gets the user from the form sent
  # Creates the user then logs you in. If fail sends you back to the page
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end


  def showerror
      @user = User.find(params[:message])
  end

  private
    # makes sure we get what we want, nothing else
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
