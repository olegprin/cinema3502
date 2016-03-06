#require_dependency "content_item"
#require_dependency "interpreter"
class Posting < ActiveRecord::Base
#include ContentItem
  include ContentItem
  belongs_to :user
  belongs_to :blog
  has_many :comments, as: :commentable

  attr_accessor :user_data             
  @model_of_attachment='cover_picture'.parameterize.underscore.to_sym
  include ValidationsForPicture               
  
  validates :title, presence: true, :length => {
    :maximum =>50}
  validates :body, presence: true, :length => {
    :minimum =>250}                               
  #after_create  :send_notifications
  def new_tag
  end
  
  def new_tag=(new_tag)
    unless new_tag.blank?
      self.tags_array += [new_tag]
      self.tags_array.uniq!
    end
  end
  
  
  def has_recipient?(recipient)
    self.recipient_ids.include?(recipient.id)
  end
  
  def public?
    self.downcase
  end
  
  def recipient_tokens
  end
  
  def recipient_tokens=(new_tokens)
    self.recipient_group_ids = new_tokens.split(",").map { |token|
      self.user.user_groups.find(token).id 
    }
    self.recipient_ids = self.recipient_group_ids.map { |group_id|
      group = self.user.user_groups.find(group_id).members
    }.flatten.uniq.compact
  end

  def css_class
    return 'expired'    if self.expire_at  && self.expire_at  <= Time.now
    return 'prerelease' if self.publish_at && self.publish_at >  Time.now 
    return 'online'
  end


  private ################################################## private ####

  # Render the intro (which is the first paragraph of the body)
  def content_for_intro
    body.paragraphs[0]
  end

  # Send a notification to admins when a new posting was created
  def send_notifications
    DelayedJob.enqueue('NewPostingNotifier',
      Time.now + (Configurable['delay_comment_notifications'].to_i).seconds,
      self.blog.id, self.id
    )
  end


end
