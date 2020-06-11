class SessionsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
      log_in user
      params[:session][:remember_me]=='1'? remember(user) : forget(user)
      # remember user
      redirect_back_or root_path
      else
        message= "Account not activated."
        message+= "Check your email for the activation link."
        flash[:warning]= message
        redirect_to root_url
      end
    else# Create an error message.
      flash.now[:danger] = "Invalid email/password combination."
        render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Log out !"
    redirect_to root_url
  end
end