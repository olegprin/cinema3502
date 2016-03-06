module FilmsHelper
  
  def email(film)
		User.find(film.user_id)
	end	

  def user_email(film)
      Info.find_by_user_id(film.user_id)
  end 

end
  
