class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create ]
  def new
  end

  def create
    session_params = params.permit(:user_name, :password)
    @user = User.find_by(user_name: session_params[:user_name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:notice]="Login successful"
      redirect_to '/'
    else
      redirect_to '/login'
      flash[:notice]="Invalid Email or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to '/login'
  end

end
