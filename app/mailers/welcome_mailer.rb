class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_greeting_notifications.subject
  #
  def send_greeting_notifications(admin_user)
    @admin_user = admin_user

    mail to: @admin_user.email, subject: 'Thank you for joining us'
  end
end
