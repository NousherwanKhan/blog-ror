# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/send_greeting_notifications
  def send_greeting_notifications
    WelcomeMailer.send_greeting_notifications
  end

end
