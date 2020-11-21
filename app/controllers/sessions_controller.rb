class SessionsController < ApplicationController
  def login

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path(@user)
    else
      flash[:notice] = "Incorrect Password or Username"
      redirect_to sessions_login_path
    end
  end

  def logout
    session.delete :user_id
  end
end
