class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :authenticate_user!, :except => [:index, :show]
  acts_as_token_authentication_handler_for User, :except => [:index, :show]
  respond_to :html, :json
  
   protected

  def json_request?
    request.format.json?
  end
  
  def admin_user?
    !!current_user.admin
  end
  
  def require_admin_user
    if !admin_user?
      flash[:danger] = "You must be an admin to perform that action"
      redirect_to root_path
    end
        
  end
  
end
 