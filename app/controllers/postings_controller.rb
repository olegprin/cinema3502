class PostingsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:new, :create, :destroy, :edit,:edit, :update]
  before_action :only_registration, only: [:new, :create, :destroy, :edit,:edit, :update]
  before_action :set_posting, only: [:show_posting, :show, :edit, :update, :destroy]
  
  #load_and_authorize_resource
  

  before_action :define_eccept, only: [:edit, :update, :destroy]

  respond_to :html, :json
  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all
  end

  def tags
    respond_to do |format|
      format.json {
        render :json => Posting.tags.reject{|t| t !~ /#{params[:q]}/i}
                        .map{|tag| [:id =>tag, :name => tag]}.flatten
      }
    end
  end
  # GET /postings/1
  # GET /postings/1.json
  def show
    @commentable=@posting
   @comment_count=@commentable.comments.paginate(
       :page => params[:page],
       :per_page => Configurable[:blogs_per_page]
    )
    #@car=Posting.parat
  end

  # GET /postings/new
  def new
    @blog=Blog.find(params[:blog_id])
    @posting=Posting.new
    #@posting.user_id=current_user.id
    respond_modal_with @posting
  end

  # GET /postings/1/edit
  def edit
    respond_modal_with @blog
  end
  
  def show_posting
    respond_modal_with @posting
  end
  # POST /postings
  # POST /postings.json
  def create
    @blog=Blog.find(params[:blog_id])
    @posting = @blog.postings.build(posting_params)
    @posting.user_id = current_user.id 
    respond_to do |format|
      if @posting.save
        format.html { redirect_to blog_path(current_blog), notice: 'Posting was successfully created.' }
        format.json { render :show, status: :created, location: @posting }
      else
        format.html { render :new }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to @posting, notice: 'Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting }
      else
        format.html { render :edit }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
      format.html { redirect_to postings_url, notice: 'Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def define_eccept   
    if current_user.postings.where(id: @posting.id).present? || can_manage(current_user.postings, @posting, Posting)
      return true
    else
      redirect_to root_path 
    end
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_posting
    begin
      @posting=Posting.find(params[:id])
    rescue
      raise Cinema::NotFound 
    end
  end
    


    def only_registration
      if user_signed_in?
        true
      else  
        redirect_to root_path
      end
    end  
    # Never trust parameters from the scary internet, only allow the white list through.
    def posting_params
      params.require(:posting).permit(:user_id, :blog_id, :body, :cover_picture, :recipient_group_ids, :recipient_ids,:title,:is_draft)
    end
end
