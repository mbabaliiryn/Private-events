class ApplicationController < ActionController::Base
  def authenticate_user
    redirect_to login_path unless current_user
  end

  def current_user
    @user = User.find_by(id: session[:user_id])

  end

  helper_method :current_user
end
