class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def github
    user = User.find_or_create_with_oauth(auth)
    session[:user_id] = user.id
    redirect_to user
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @error = "Incorrect username and/or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to signin_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
