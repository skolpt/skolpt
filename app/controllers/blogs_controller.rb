class BlogsController < ApplicationController
  # Only admin are allowed to enter data
  before_action :require_admin_user, except: [:index, :show]
  
  
  def index
    @blogs = Blog.all
    @blogs = Blog.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    
    if @blog.save
      flash[:success] = "Blog post has been created successfully"
      redirect_to blogs_path
    else
      render :new
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:success] = "Blog post have been successfully updated"
      redirect_to blogs_path
    else
      render :edit
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:success] = "Blog post has been deleted"
      redirect_to blogs_path
    else
      render :edit
    end
  end
  
  private
    
    # 
    def blog_params
      params.require(:blog).permit(:title, :content, :byline)
    end
  
end