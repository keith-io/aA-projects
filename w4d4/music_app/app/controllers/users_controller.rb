class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Incorrect Credentials"]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end