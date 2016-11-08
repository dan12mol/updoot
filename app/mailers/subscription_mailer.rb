class SubscriptionMailer < ApplicationMailer
  default from: 'subscription@updoot.com'

  def subscription_email(user)
    @user = user
    mail(to: @user.email, subject: 'Updoot digest')
  end

end
