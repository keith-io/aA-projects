class SessionsController < ApplicationController

  # controller actions
  def new

    render :new
  end

  def create
    @user ||= User.find_by(:user_name)
    if @user
      @password_digest = BCrypt::Password.create()
    is_password?(user_params[:password])
  end

  def destroy

  end

  private

  #strong params
end