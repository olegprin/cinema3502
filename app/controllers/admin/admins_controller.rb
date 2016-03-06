class Admin::AdminsController < ApplicationController
  
  #before_action :only_admin_or_moderator
  #before_action :only_admin, only: [:make_admin]

  def make_admin

  end
  
  def make_moderator

  end  

  def ban_the_user
    @infos=Info.all
    @info=Info.find_by(id: params[:id])
      if @info.ban==false
        @info.update_attribute(:ban, true)
      else 
        @info.update_attribute(:ban, false)
      end
    render "infos/index"
  end 

  def delete_user
    @user=User.find_by(id: params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
   end

  
  private
  
  def only_admin_or_moderator
    if current_user.admin==true
      true
    else
      redirect_to root_path  
    end
  end

end