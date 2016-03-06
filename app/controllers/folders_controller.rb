class FoldersController < ApplicationController
   before_filter :authenticate_user! 
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @folder = current_user.folders.new
    if params[:folder_id]
      @current_folder = current_user.folders.find(params[:folder_id]) 
       
     #then we make sure the folder we are creating has a parent folder which is the @current_folder 
     @folder.parent_id = @current_folder.id 
  end
end
  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.build(folder_params)

    #respond_to do |format|
      if @folder.save
      
        if @folder.parent #checking if we have a parent folder on this one 
        #format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        #format.json { render :show, status: :created, location: @folder }
      redirect_to browse_path(@folder.parent)  #then we redirect to the parent folder 
    else
      redirect_to root_url #if not, redirect back to home page 
    end
     # else
      #  format.html { render :new }
       # format.json { render json: @folder.errors, status: :unprocessable_entity }
     # end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id, :user_id)
    end
end
