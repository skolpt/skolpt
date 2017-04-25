class VariationsController < ApplicationController
  #before_action :authenticate_user!, :set_exercise
  before_action :set_exercise
  before_filter :set_variation, only: [:show, :edit, :update, :destroy]
  
  def new
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @variation = Variation.new
    end
  end
  
  def show
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @variation = Variation.find(params[:id])
    end 
  end
  
  def create
    if !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @variation = @exercise.variations.build(variation_params)
      if @variation.save
        flash[:success] = "Variation has been created"
        redirect_to exercise_path(@exercise)
      else
        flash.now[:danger] = "Variation has not been created"
        render :edit
      end
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
      if @variation.update(variation_params)
          flash[:success] = "Variation has been updated"
          redirect_to exercise_path(@exercise)
      else
        flash.now[:danger] = "Variation has not been updated"
        render :edit
      end
    end
  end
  
  def destroy
    if @variation.destroy
      flash[:success] = "Variation has been deleted"
      redirect_to exercise_path(@exercise)
    end
  end
  
  private 
    def variation_params
      params.require(:variation).permit(:name, :description)
    end
    
    def set_variation
      @variation=Variation.find(params[:id])
    end
    
    def set_exercise
      @exercise=Exercise.friendly.find(params[:exercise_id])
    end
end