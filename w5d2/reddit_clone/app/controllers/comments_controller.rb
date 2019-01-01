class CommentsController < ApplicationController
  before_action :require_logged_in
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end
  
  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end