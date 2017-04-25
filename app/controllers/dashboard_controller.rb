class DashboardController < ApplicationController
  
  def index
    if !current_user.nil? && session[:user_id] == current_user.id && current_user and current_user.id == params[:id]
      #flash[:success] = "Welcome back " + current_athlete.email+"!"
    else
      flash[:danger] = "You are not logged in"
      redirect_to root_path
    end
  end
  def show
    @user = User.find(params[:id])
    
    if !current_user.nil?
      #flash[:success] = "Welcome back " + current_athlete.email+"!"
    else
      flash[:danger] = "Not allowed, are have you logged in?"
      redirect_to root_path
    end
  end
end