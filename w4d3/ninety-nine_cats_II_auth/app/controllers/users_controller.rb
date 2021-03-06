class UsersController < ApplicationController

  # def index
  #   render :index
  # end

  # def show
  #   render :show
  # end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # def update
  # end

  # def destroy
  # end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end