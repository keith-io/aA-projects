class SessionsController < ApplicationController
  def new
    # rails is smart enough to render :new?
  end

  def create
    creds = [user_params[:username], user_params[:password]]
    @user = User.find_by_credentials(*creds)
    if @user
      login(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end