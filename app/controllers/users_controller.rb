class UsersController < ApplicationController

  def new # signup form and submit data
    @user = User.new
  end

  def create # handle new form signup data
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username}, you have successfully signed up"
      redirect_to root_path
    else
      flash[:error] = 'Something was wrong with your data'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
