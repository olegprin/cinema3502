class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  # GET /loads
  # GET /loads.json
  def index
    if current_user.admin?
    @loads = Load.all
  else
     #show only root folders (which have no parent folders) 
     @folders = current_user.folders.roots  
     #show only root files which has no "folder_id" 
     @loads = current_user.loads.where("folder_id is NULL").order("uploaded_file_file_name desc")       
   # @folders=current_user.folders.order("name desc")

  end
end
  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = current_user.loads.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end
 def browse 
    #get the folders owned/created by the current_user 
    @current_folder = current_user.folders.find(params[:folder_id])   
  
    if @current_folder
    
      #getting the folders which are inside this @current_folder 
      @folders = @current_folder.children 
  
      #We need to fix this to show files under a specific folder if we are viewing that folder 
      @loads = @current_folder.loads.order("uploaded_file_file_name desc") 
  
      render "loads/index"
    else
      flash[:error] = "Don't be cheeky! Mind your own folders!"
      redirect_to root_url 
    end
end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def get 
load = current_user.loads.find_by_id(params[:id]) 
if load
     send_file load.uploaded_file.path, :type => load.uploaded_file_content_type 
end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:user_id, :uploaded_file, :folder_id)
    end
end
