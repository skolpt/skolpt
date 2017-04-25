class RoutinesController < ApplicationController
  def index
    @routines = Routine.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @routine = Routine.new
    end
  end
  
  def create
    @routine = Routine.new(routine_params)
    @routine.user = current_user
    if @routine.save
      flash[:success] = "Exercise has been created"
      redirect_to routines_path
    else
      flash.now[:danger] = "Exercise has not been created"
      render :new
    end
  end
  
  def show
    @routine = Routine.find(params[:id])
  end
  
  def edit
    @routine = Routine.find(params[:id])
  end
  
  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      flash[:success] = "Workout routine has been successfully updated"
      redirect_to routine_path(@routine)
    else
      render :edit
    end
  end
  
  def destroy
    @routine = Routine.find(params[:id])
    if @routine.destroy
      flash[:success] = "Workout Routine has been deleted"
      redirect_to rotuines_path
    else
      render :edit
    end
  end
  
  private
    def routine_params
      params.require(:routine).permit(:title, :description, :difficulty, 
          :routine_exercises_attributes => [:id, :exercise, :exercise_id, :routine_id, :sets, :reps, :_destroy])
    end
end