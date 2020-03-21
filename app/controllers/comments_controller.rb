class CommentsController < ApplicationController

  def new
    @comment = current_micropost.comments.new
  end
  
  
  def create
    @comment = current_micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to root_path
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:message)
    end
  
end
