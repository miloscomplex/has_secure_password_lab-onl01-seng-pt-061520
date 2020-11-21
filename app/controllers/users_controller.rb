class UsersController < ApplicationController
  before_action :logged_in?, only: [:homepage]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to homepage_path(@user)
    else
      redirect_to users_new_path 
    end
  end

  def homepage
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def logged_in?
    redirect_to sessions_login_path unless session.include? :user_id
  end
end
