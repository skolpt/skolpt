class FeedbacksController < ApplicationController

  def index
    if current_athlete != nil
      if current_athlete.admin?
        @feedbacks = Feedback.paginate(page: params[:page], per_page: 20)
      end
    else
      flash[:danger] = "You do not have the permissions to view that page"
        redirect_to root_path
    end
  end
  
  def show
    if current_athlete != nil
      if !current_athlete.admin?
        flash[:danger] = "You do not have the permissions to view that page"
        redirect_to root_path
      else
        @feedback = Feedback.find(params[:id])
      end
    else
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    end
  end
  
  def new
    @feedback = Feedback.new
  end
  
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.actioned = false
    
    if @feedback.save
      flash[:success] = "Thank you for your feedback, it has been submitted for the founders to review."
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    if current_athlete != nil
      if !current_athlete.admin?
        flash[:danger] = "You do not have the permissions to view that page"
        redirect_to root_path
      else
        @feedback = Feedback.find(params[:id])
      end
    else
      flash[:danger] = "You do not have the permissions to view that page"
        redirect_to root_path
    end
  end 
  
  def update
    if !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @feedback = Feedback.find(params[:id])
      if @feedback.update(feedback_params)
        flash[:success] = "Feedback has been successfully updated"
        redirect_to feedback_dashboard_path
      else
        render :edit
      end
    end
  end
  
  def destroy
    if !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @feedback = Feedback.find(params[:id])
      if @feedback.destroy
        flash[:success] = "Feedback has been deleted"
        redirect_to feedback_dashboard_path
      end
    end
  end
  
  
  private
    
    # 
    def feedback_params
      params.require(:feedback).permit(:name, :email, :type_of_feedback, :summary, :actioned)
    end
  
end