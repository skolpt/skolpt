class CategoriesController < ApplicationController
  #before_action :authenticate_user!
  before_filter :set_category, only: [:show, :update, :destroy]
  
   def index
     if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @categories = Category.all
    end
  end
  
  def new
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @category = Category.new
    end
  end
  
  def show
    if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @category = Category.find(params[:id])
    end 
  end
  
  def create
    @category = Category.new(params.require(:category).permit(:name, :description))
    if @category.save
      flash[:success] = "Category has been created"
      redirect_to categories_path
    else
      flash.now[:danger] = "Category has not been created"
      render :new
    end
  end
  
  def edit
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    end
  end 
  
  def update
    if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      if @category.update(category_params)
          flash[:success] = "Category has been updated"
          redirect_to @category
      else
        flash.now[:danger] = "Category has not been updated"
        render :edit
      end
    end
  end
  
  def destroy
    if @category.destroy
      flash[:success] = "Category has been deleted"
      redirect_to categories_path
    end
  end
  
  private 
    def category_params
      params.require(:category).permit(:name, :description)
    end
    
    def set_category
    @category=Category.find(params[:id])
    end
end