class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :authenticate_user!, :except => [:index, :show, :new, :create, :edit]
  acts_as_token_authentication_handler_for User, :except => [:index, :show, :new, :create, :edit]
  respond_to :html, :json
  
  protected

    def json_request?
      request.format.json?
    end
    
    # Check to see if admin user
    def admin_user?
      if current_user != nil
        !!current_user.admin
      end
    end
    
    def require_admin_user
      if !admin_user?
        flash[:danger] = "You do not have the permissions to perform that action"
        redirect_to root_path
      end
    end
  
end
 