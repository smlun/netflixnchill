class UserMailer < ApplicationMailer
  default from: "smlun@msn.com"

  def order_confirm_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your receipt for ORDER DETAILS')
  end

end
