class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to jobs_path
      flash.now[:primary] = "You are logged in"
    else 
      redirect_to login_path
      flash[:danger] = "Invalid email/password"
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
    flash[:danger] = "Now you are logout"
  end
end
