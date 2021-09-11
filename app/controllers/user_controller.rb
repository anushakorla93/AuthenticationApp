class UserController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :index, :update ]

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def index
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_reset_path
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to '/login'
    else
      render :edit
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end
end
