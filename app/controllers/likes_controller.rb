class LikesController < ApplicationController

  def create
    @idea = Idea.find params[:idea_id]
    l = Like.new(idea: @idea, user: current_user)
    if l.save
      redirect_to ideas_path, notice: "Liked!"
    else
      redirect_to ideas_path, alert: "Can't Like!"
    end
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    redirect_to ideas_path, notice: "Un-Liked"
  end
end
