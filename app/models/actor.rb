class Actor < ActiveRecord::Base
  #include ObjectModel::Model
  
  has_many :comments, as: :commentable
  has_one :user

  @model_of_attachment='uploaded_photo'.parameterize.underscore.to_sym	
  include ValidationsForPicture

  #def clients_wants_films?
   #  a=Info.where(send_new_film: true)
    # a.map { |user_id| user_id.user.email }
  #end

 # def send_film_to_user
    #FilmMailer.new_film(self).deliver_now
  #end





end
