class UserMailer < ActionMailer::Base
    def forgot_password(user)
        @user = user
        @greeting = "Hi"
        
        mail to: user.email, :subject => 'Reset password instructions'
    end
end