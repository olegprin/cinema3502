class OrderMailer < ApplicationMailer
 

  def new_order(order)
    @order = order
    mail(to: ["#{order.email}", "inutero88@mail.ru"], subject: "New order: #{order.email}")
  end

end
