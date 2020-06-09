class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged?,
                :log_out

  private

  def authenticate_user!
    unless current_user
      cookies[:redirect_path] = request.path if request.get?
      redirect_to login_path, alert: 'Please, verify your e-mail and password!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
