class SessionsController < ApplicationController

  def new # login form and submit data
  end

  def create # handle new form login data
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = "Credentials were wrong."
      render 'new'
    end
  end

  def destroy # logout - delete session
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end

end
