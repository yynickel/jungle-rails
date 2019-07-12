class UserMailer < ApplicationMailer
  def welcome_email(order)
    @order=order
    mail(to: 'test@test.com', subject: "Order ID #{@order.id} placed successful!")
  end
end
