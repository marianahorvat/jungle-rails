class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

 def purchase_email(order:, to_display:)
  @order = order
  @to_display = to_display
  @products = @order.line_items
  email = order.email
  puts @order
  puts @to_display
  puts email
  puts @products
  mail(to: email, subject: 'Your order has been successfully placed')
end
end