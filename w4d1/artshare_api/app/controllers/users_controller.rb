class UsersController < ApplicationController
  def index
    all_users = User.all
    render json: all_users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: params
    else
      render json:  user.errors.full_messages, status: :unprocessable_entity 
    end
  end
  
  def show
    user = User.find_by(id: params[:id])
    render json: user
  end
  
  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(user_params)
      render json: user
    else
      render json:  user.errors.full_messages, status: :unprocessable_entity 
    end
  end
  
  def delete
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      redirect_to users_url
    else
      render plain: "nothing to delete"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

