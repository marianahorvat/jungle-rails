class SessionsController < ApplicationController

  def new
  end

  def create
    byebug
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # If user exists and the password entered by the user is correct.
      # Save the user id in the browser cookie to keep the user logged in when they navigate this website
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If the user login is incorrect, they are redirected to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end