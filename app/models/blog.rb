require_dependency "content_item"

class Blog < ActiveRecord::Base

  belongs_to :user
  has_many :postings, dependent: :destroy
  validates :cover_picture, presence: true 

  validates :title, presence: true, uniqueness: true, :length => {
    :maximum =>50}

  validates :synopsis, presence: true, uniqueness: true, :length => {
    :minimum =>400}


  scope :drafts, -> { where(is_draft: false ) }
  scope :online, -> { where(
                 {:publish_at=>nil,:expire_at=>nil},
                 {:publish_at.lte=>Time.now(),:expire_at=>nil},
                 {:publish_at.lte=>Time.now(),:expire_at.gt=>Time.now()},
                 {:publish_at => nil, :expire_at.gt=>Time.now()}
                )}

        scope :expired,     -> { where(:expire_at.lte=>Time.now) }
        scope :pre_release, -> { where(:publish_at.gt => Time.now()) }
        scope :desc, -> {where('created_at DESC')}
 
  @model_of_attachment='cover_picture'.parameterize.underscore.to_sym
  include ValidationsForPicture

        if self.respond_to?(:is_template)
          scope :published, -> { where(is_draft: false, is_template: false) }
        else
          scope :published, -> { where(is_draft: false) }
        end
        
    def expire_at_date=(new_date)
          unless new_date.nil? || new_date.blank?
            y,m,d = new_date.split(/\\-|\\.|:|\\/)
            self.expire_at = Time.new(y.to_i,m.to_i,d.to_i)
          else
            self.expire_at = nil
          end
        end
          
  def postings_for_user_and_mode(_user,_draft_mode=false)
    self.postings.where(is_draft: false)
       
      #_online =  self.postings.online.only(:id).map(&:id)
      #_public =  self.postings.publics.only(:id).map(&:id) 
      #_published=self.postings.published.only(:id).map(&:id) 
      #return self.postings.for_ids(_online & _public & _published)

    # if user is moderator and in draft_mode then return all postings
    if _user.role?(:moderator)
      return self.postings.all
    end

    #_addressed_ids = self.postings.addressed_to(_user.id).only(:id).map(&:id)
    # in range of publish_at and enxpire_at
    #_online_ids = self.postings.online.only(:id).map(&:id)

    unless _user.role?(:moderator)
      unless _draft_mode
        #_visible_ids = _online_ids & self.postings.published.only(:id).map(&:id) & _addressed_ids
      else
        #_visible_ids = _addressed_ids
      end
    else
      #_visible_ids = _online_ids & self.postings.published.only(:id).map(&:id)
    end

    #self.postings.for_ids( _visible_ids )
  end



end
