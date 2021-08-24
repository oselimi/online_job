class UsersController < ApplicationController
  before_action :authenticate_user, only: :show
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      log_in(@user)
      flash[:primary] = "Hello #{@user.full_name}, successfully you create account."
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
