class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def goodbye_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thank you for using our service. Hopefully we will see you back again.')
  end
end
