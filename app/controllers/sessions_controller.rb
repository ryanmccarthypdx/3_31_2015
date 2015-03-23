class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "Login successful!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end


end
