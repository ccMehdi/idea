class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @idea        = Idea.find params[:idea_id]
    @comment          = Comment.new comment_params
    @comment.idea = @idea
    @comment.user = current_user
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment created!"
    else
      flash[:alert] = "Comment not added"
      render "/questions/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
