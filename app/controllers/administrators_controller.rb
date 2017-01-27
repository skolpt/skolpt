class AdministratorsController < ApplicationController
  before_filter :set_athlete, only: [:show]
  
  def index
    if current_athlete.nil? || !current_athlete.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @athletes = Athlete.all
    end
  end
  def show
   
  end 

  def set_athlete
      @athlete=Athlete.friendly.find(params[:id])
  end
end