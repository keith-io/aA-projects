class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    # self.current_user.session_token == session[:session_token]
    !!current_user
  end
end
