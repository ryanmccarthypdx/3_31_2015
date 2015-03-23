class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      flash[:notice] = "Success! Please log in below"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation)
  end
end
