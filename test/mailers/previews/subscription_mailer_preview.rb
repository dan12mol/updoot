# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview
  def subscription_mail_preview
    SubscriptionMailer.subscription_email(User.first)
  end
end
