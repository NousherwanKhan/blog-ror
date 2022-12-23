require "test_helper"

class WelcomeMailerTest < ActionMailer::TestCase
  test "send_greeting_notifications" do
    mail = WelcomeMailer.send_greeting_notifications
    assert_equal "Send greeting notifications", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
