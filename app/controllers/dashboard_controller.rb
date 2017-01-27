class DashboardController < ApplicationController
  
  def index
    if !current_athlete.nil? && session[:athlete_id] == current_athlete.id && current_athlete and current_athlete.id == params[:id]
      flash[:success] = "Welcome back " + current_athlete.email+"!"
    else
      flash[:danger] = "You are not logged in"
      redirect_to root_path
    end
  end
  def show
    @athlete = Athlete.find(params[:id])
    
    if !current_athlete.nil?
      flash[:success] = "Welcome back " + current_athlete.email+"!"
    else
      flash[:danger] = "Not allowed, are have you logged in?"
      redirect_to root_path
    end
  end
end