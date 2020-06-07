class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged?,
                :log_out

  private

  def authenticate_user!
    session[:path] = request.path
    return redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please' unless current_user

    cookies[:email] = current_user.email
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
