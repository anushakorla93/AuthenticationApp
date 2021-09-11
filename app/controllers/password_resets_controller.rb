class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:notice] = 'E-mail sent with password reset instructions.'
    redirect_to '/'
  end
end
