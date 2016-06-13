class ExercisesController < ApplicationController
  #before_action :authenticate_user!, :except => [:index, :show]
  before_filter :set_exercise, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  skip_before_filter :verify_authenticity_token, :only => [:upvote, :downvote]
  
  def index
    # @exercises = Exercise.all
    # The following arranges for pagination on the index page
    @exercises = Exercise.paginate(page: params[:page], per_page: 10)

    if params[:search]
      @exercises = Exercise.search(params[:search]).paginate(page: params[:page], per_page: 10)
    elsif params[:muscle_groups_id]
      @exercises = Exercise.where(:muscle_groups_id => params[:muscle_groups_id]).paginate(page: params[:page], per_page: 10)
    else
      @exercises = Exercise.paginate(page: params[:page], per_page: 10)
    end
  end
  
  def new
    if current_athlete.nil? || !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @exercise = Exercise.new
    end
  end
  
  def create
    @exercise = current_athlete.exercises.build(exercise_params)
    if Exercise.exists?(name: @exercise.name)
      flash.now[:danger] = "Exercise has not been created, duplicate entry"
      render :new
    elsif @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to exercises_path
    else
      flash.now[:danger] = "Exercise has not been created"
      render :new
    end
  end
  
  def edit
    if current_athlete.nil? || !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    end
  end 
  
  def update
    if !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      if @exercise.update(exercise_params)
        flash[:success] = "Exercise has been updated"
        redirect_to @exercise
      else
        flash.now[:danger] = "Exercise has not been updated"
        render :edit
      end
    end
  end
        
  def show
    @category = Category.find(@exercise.categories_id)
    @muscle_group = Muscle_group.find(@exercise.muscle_groups_id)
    @variations = Variation.where(:exercise_id => @exercise)
    @variation = @exercise.variations.build
  end 
  
  def destroy
    if @exercise.destroy
      flash[:success] = "Exercise has been deleted"
      redirect_to exercises_path
    end
  end
  def upvote
    @exercise.upvote_by current_athlete
    if @exercise.vote_registered?
      flash[:success] = "Successfully liked"
      respond_to do |format|
        format.html {redirect_to :back }
        format.json { render json: { count: @exercise.get_upvotes.size } }
      end
    else
      flash[:danger] = "You have already liked this"
      respond_to do |format|
        format.html {redirect_to :back }
        format.json { head :conflict }
      end
    end
  end
  def downvote
    @exercise.downvote_by current_athlete
    if @exercise.vote_registered?
      flash[:success] = "Successfully disliked"
      respond_to do |format|
        format.html {redirect_to :back }
        format.json { render json: { count: @exercise.get_downvotes.size } }
     end
    else
       flash[:danger] = "You have already disliked this"
      respond_to do |format|
        format.html {redirect_to :back }
        format.json { head :conflict }
      end
    end
  end
  
  private 
    def exercise_params
      params.require(:exercise).permit(:name, :description, :setup, :summary, :categories_id, :muscle_groups_id, :picture)
    end
    
    def set_exercise
      @exercise=Exercise.friendly.find(params[:id])
    end
end
