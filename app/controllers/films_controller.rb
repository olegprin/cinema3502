class FilmsController < ApplicationController


  before_action :authenticate_user!, :only => [:edit, :new, :create, :update,:destroy]  
  #load_and_authorize_resource
  
  before_action :set_film, only: [:show_modal,:get, :upload, :show, :edit, :update, :destroy, :upvote, :downvote ]
  before_action :define_eccept, only: [:edit, :update, :destroy]
 
  #before_action :cul_user, :except => [:show, :index]  
 
  respond_to :html, :js, :json
  # GET /films
  # GET /films.json

  # GET /films/1
  # GET /films/1.json
  def show
    @user=User.find(@film.user_id)
    @info=@user.info
    
      @commentable=@film
   @comment_count=@commentable.comments.paginate(
       :page => params[:page],
       :per_page => Configurable[:blogs_per_page]
    )
  
      respond_to do |format|
        format.html
        format.pdf {send_data @film.receipt.render, filename: "#{@film.title}-receipt.pdf", type: "application/pdf", disposition: :attachment}
      end
  end


  # GET /films/new
  def new
    @film = Film.new
    respond_modal_with @film
  end
  
  def show_modal
    @user=User.find(@film.user_id)
    @info=@user.info
    respond_modal_with @film
  end  
  # GET /films/1/edit
  def edit
     
  end

  def create
    @film = current_user.films.build(film_params)
    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json {  }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { redirect_to @film }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def horror 
    @films = Film.where(["category LIKE ?", "Horror"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film" 
  end 

  def other
    @films = Film.where(["category LIKE ?", "Other"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film" 
  end 

  def documental
    @films = Film.where(["category LIKE ?", "Documental"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end 
  
  def trailer

  end
    
  def top_rated
    d=Voice.where(["votable_type LIKE ?", "Film"]).where(["vote_flag LIKE ?", true])
      @films=[]
      d.each do |d|
        
      d=Film.find(d.votable_id)
      
       @films<<d
    end
    #@top_rated=params[:films][:top_rated]  
    #@films = Film.where(id: (Voice.where(["votable_type LIKE ?", "Film"])).id).paginate(:page => params[:page], :per_page => 8)
    render "all_film"
  end

  def latest
    @films = Film.order('created_at DESC').paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end

  def comedy
    @films = Film.where(["category LIKE ?", "Comedy"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end

  def history
    @films = Film.where(["category LIKE ?", "History"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end  

  def search
    @films=Film.where(["title LIKE ?","%#{params[:short_search]}%"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film" 
  end 

  def get 
    if @film
      send_file @film.down_file.path, :type => @film.down_file_content_type 
    end
  end


  def action
    @films = Film.where(["category LIKE ?", "Action"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end
  

  def upvote
    @film.upvote_from current_user
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def downvote
    @film.downvote_from current_user
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end 


  def download
    fileName=params[:download][:fileName]
    send_file(Rails.root.join('public','files', fileName))
  end

  private
  
  def define_eccept   
    if current_user.films.where(id: @film.id).present? || can_manage(current_user.films, @film, Film)
      return true
    else
      redirect_to root_path 
    end
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_film
    begin
      @film=Film.find(params[:id])
    rescue
      raise Cinema::NotFound 
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def film_params
    params.require(:film).permit(:send_new_film,:title, :description, :category, :actor, :subtitle, :language, :year,:image, :uploaded_file, :remove_image, :user_id, :down_file)
  end

end
