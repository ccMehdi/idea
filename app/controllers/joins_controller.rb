class JoinsController < ApplicationController


    def create
      @idea = Idea.find params[:idea_id]
      j = Join.new(idea: @idea, user: current_user)
      if j.save
        redirect_to ideas_path, notice: "Joined!"
      else
        redirect_to ideas_path, alert: "Can't Like!"
      end
    end

    def destroy
      join = Join.find params[:id]
      join.destroy
      redirect_to ideas_path, notice: "Un-joined"
    end


end
