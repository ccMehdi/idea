class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email_address params[:email_address]
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to ideas_path, notice: "You are logged in"
      else
        flash[:alert] = "Wrong credentials"
        render :new

      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to ideas_path, notice: "Logged out!"
  end

end
