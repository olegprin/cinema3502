class ApplicationMailer < ActionMailer::Base

 

  default from: Configurable['registration_from']

  layout 'mailer'


end
