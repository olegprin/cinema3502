module BlogsHelper

  def paragraph(str)
    str.split("\n\n", 2)[0]
  end
  
  def current_posting
    @post=Blog.where(user_id: current_user.id)
    @post
  end
   
  def sur
   
  end  

end
