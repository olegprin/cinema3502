  ActionMailer::Base.smtp_settings={
 	address: "smtp.mandrillapp.com", 
 	port: 587,
 	enable_starttls_auto: true,
 	user_name: "oleg.starosvitskij@gmail.com",
 	password: "N98nuWmJpMt566hJKa9iuA",
 	authentication: "login"

 }

 ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: "utf-8"