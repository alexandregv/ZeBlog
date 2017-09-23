class UserMailer < ApplicationMailer

    def confirm(user)
        @user = user
        mail(to: user.mail, subject: 'Votre compte ' + Rails.application.config.site[:name])
    end

end
