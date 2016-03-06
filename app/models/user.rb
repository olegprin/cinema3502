class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :user_first
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:digitalocean,:google_oauth2, :facebook]

        


  before_destroy { |user| user.comments.destroy_all }
  has_many :comments, dependent: :destroy
  has_one :info, dependent: :destroy
  has_many :films
  has_many :messages
  has_many :actors
  has_one :blog
  has_many :postings
  has_many :invitations
  has_many :loads, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :messagestoadministrators

  after_create :send_notification
  after_create :create_role_and_info
  

  ROLES = {0 => :guest, 1 => :user, 2 => :moderator, 3 => :admin}

  def create_role_and_info
    a=Info.new
    a.update_attributes(user_id: self.id, id: self.id)
    unless self.role.present?
      update_attributes(role: "user")
    end    
  end 

  def role?(role_name)
    if role.present?
      role.to_sym == role_name
    else 
      role="quest"
    end
  end
  
  def user_first
    if User.first.present?
      true
    else
      self.admin=true
      self.role="admin"
    end
  end


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def email_verified?
    true
  end




  def send_notification
  	AdminMailer.new_user(self).deliver_now
    AdminMailer.new_user_admin(self).deliver_now
  end

end

