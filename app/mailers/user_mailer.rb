class UserMailer < ApplicationMailer
  default from: "lee@scatmanjorgensen.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "A beautiful yakful day to you, kind sir/madam,"

    mail to: user.email, subject: "Yakyakyakyak"
  end
end
