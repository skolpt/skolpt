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
  private 
    def muscle_group_params
      params.require(:muscle_group).permit(:name, :description)
    end
    
    def set_muscle_group
    @muscle_group=Muscle_group.find(params[:id])
    end
end