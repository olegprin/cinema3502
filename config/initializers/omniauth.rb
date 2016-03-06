OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 837640676348522, 'ba304eb580234935e56afcf3e47b3b60', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

#Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
#end