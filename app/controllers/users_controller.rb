class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    set_user
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
