class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    # Validates user, password
    if @user && @user.authenticate(params[:password])
      # Save user id in cookies, redirect to home 
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # Redirect to login in attempt was unsuccessful
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end