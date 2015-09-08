class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to ideas_path(@idea), notice: "Your Idea has been added!"
    else
      flash[:alert] = "See errors below"
      render :new
    end
  end

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: "Your Idea has been updated!"
    else
      flash[:alert] = "See errors below"
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Your Idea has been deleted!"
  end




  private

  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit([:title, :body, :user_id])
  end

end
