class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to signin_path
  end
end
