class BlogsController < ApplicationController
  
  respond_to :html, :json
  
  
  before_action :authenticate_user!, :except => [:show_blog, :show, :index, :about, :contact, :features,:services]
  before_action :define_eccept, only: [:edit, :update, :destroy]
  before_action :set_blog, only: [:services, :show_blog,:show, :edit, :update, :destroy]
  before_action :set_info
  # GET /blogs.json
  def index
    @blogs = Blog.all.paginate(
       :page => params[:page],
       :per_page => Configurable[:blogs_per_page]
    )
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @postings = @blog.postings.where(is_draft: false)
      @blog_show="active"
      if @posting.present?
        @postings = @posting.order('created_at DESC').paginate(:page => params[:page],:per_page => Configurable[:postings_per_page])
      end
    respond_to do |format|
      format.html {render "services"}
    end
    
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @new="active"
   
  end

  # GET /blogs/1/edit
  def edit
    respond_modal_with @blog
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = current_user.build_blog(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end 
    end       
  end

  
  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def about
    @info =Info.find_by(current_user.id)
    @user=current_user
    @about="active"
    render partial: "infos/show"
  end
  
  def show_blog
    respond_modal_with @blog
  end
    
  def home
    @blog=current_user.blog
    @home="active"
    render "about"
  end
  
  def search
    @blog=Blog.where(["title LIKE ?","%#{params[:search]}%"]).first
    render "show" 
  end 

  def contact
    @messagestoadministrator=Messagestoadministrator.new
    @contact="active"
  end

  def features
    @features="active"
  end

  def services
 
    @new="active"
  end
    
  private
    
    def define_eccept   
      if can_manage_has_one(current_user.blog, @blog, Blog)
        return true
      else
        redirect_to root_path 
      end
    end
    
    def set_info
      @info_blog = Info.where("name IS NOT NULL AND photo_content_type IS NOT NULL", "", "")
      @blog_side = Info.where("name IS NOT NULL AND photo_content_type IS NOT NULL", "", "")
    end

    def delete_cover_picture
      @blog.cover_picture.destroy
      @blog.save
    end
   
    def set_blog
      begin
        @blog=Blog.find(params[:id])
      rescue
        raise Cinema::NotFound 
      end
    end

    def set_info
      @blog_array=Array.new
      @info_blog=Info.where("name is NOT NULL and photo_file_size  is NOT NULL", "","").sample(Configurable[:info_blog])
      blog=Blog.includes(:postings)
      blog.each do |blog|
        if blog.is_draft== false
          @blog_array<<blog
        end
      end
      @blog_redy=@blog_array.sample(Configurable[:blog_redy])
      @posting_of_blog=Array.new
      @blog_array.each do |blog|
        blog.postings.each do |posting|
          @posting_of_blog<<posting
        end  
      end 
      @posting_of_blog.sample(Configurable[:posting_redy]) 
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:cover_picture, :user_id, :allow_comments, :allow_public_comments, :name, :content, :title, :synopsis)
    end

end
