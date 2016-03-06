class Admin::ConfigurablesController < Admin::AdminsController
  
  def index
    @configurable=Configurable.all  
  end 

    
  def edit
    @configurable=Configurable.find(params[:id])
  end
  

  def update
    @configurable=Configurable.find(params[:id])
    if @configurable.update(configurable_params)
    redirect_to admin_configurables_path
  end
 end

  private

    def configurable_params
      params.require(:configurable).permit(:value, :name)
    end

end
