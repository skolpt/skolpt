class AdministratorsController < ApplicationController
  before_filter :set_user, only: [:show]
  
  def index
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "You do not have the permissions to view that page"
      redirect_to root_path
    else
      @user = User.all
    end
  end
  def show
   
  end 

  def set_user
      @user=User.friendly.find(params[:id])
  end
end