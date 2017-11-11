class MuscleGroupsController < ApplicationController
  #before_action :authenticate_user!
  before_filter :set_muscle_group, only: [:show, :update, :edit, :destroy]
  
  def index
    if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @muscle_groups = Muscle_group.all
    end
  end
  
  def new
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @muscle_group = Muscle_group.new
    end
  end
  
  def show
    if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @muscle_groups = Muscle_group.find(params[:id])
    end 
  end
  
  def create
    @muscle_groups = Muscle_group.new(params.require(:muscle_group).permit(:name, :description))
    if @muscle_groups.save
      flash[:success] = "Category has been created"
      redirect_to muscle_groups_path
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
      if @muscle_group.update(muscle_group_params)
          flash[:success] = "Category has been updated"
          redirect_to @muscle_group
      else
        flash.now[:danger] = "Category has not been updated"
        render :edit
      end
    end
  end
  
  private 
    def muscle_group_params
      params.require(:muscle_group).permit(:name, :description)
    end
    
    def set_muscle_group
    @muscle_group=Muscle_group.find(params[:id])
    end
end