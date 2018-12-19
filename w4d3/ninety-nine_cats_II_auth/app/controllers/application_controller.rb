class ApplicationController < ActionController::Base

  def login!(user)
    debugger
    session[:session_token] = user.reset_session_token!
  end
end
