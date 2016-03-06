class Invitation < ActiveRecord::Base
  
  include ObjectModel::ExtendedModel
  belongs_to :user
  after_create       :send_invitation


  def self.random(len)
  	rand(36**len).to_s(36)
  end
  #def generate_token
   #  self.token = random_string(10)
 # end

  def send_invitation
    InvitationMailer.new_invitation(self).deliver_now
  end


end
