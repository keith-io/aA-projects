class SessionsController < ApplicationController

  def new
    # @user = User.new    not needed anymore
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ['Incorrect username and/or password']
      render :new
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
  end
end