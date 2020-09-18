class ApplicationController < ActionController::Base
  helper_method :signed_in?, :current_user, :redirect_to_signin?, :authorized?, :redirect_if_not_authorized

  private
  def signed_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def redirect_to_signin?
    redirect_to '/signin' if !signed_in?
  end

  def authorized?(record)
    record && record.user_id == current_user.id
  end

  def redirect_if_not_authorized(record)
    redirect_to root_path if !authorized?(record)
  end
end
