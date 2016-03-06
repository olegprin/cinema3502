class AdminsController < Admin::AdminsController
  




  def index 
    @infos = Info.all
    @user=User.all
  end 
  
 

end