class SessionsController < Devise::SessionsController
  
  def create
   self.resource = warden.authenticate!(auth_options)
   sign_in(resource_name, resource)
 
   current_athlete.update authentication_token: nil
 
   respond_to do |format|
     format.json { render :json => {  :athlete => current_athlete, :status => :ok, :authentication_token => current_athlete.authentication_token } }
     format.html { super }
   end
  end

  # DELETE /resource/sign_out
  def destroy
 
   respond_to do |format|
     format.json {
       if current_athlete
         current_athlete.update authentication_token: nil
         signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
         render :json => {}.to_json, :status => :ok
       else
         render :json => {}.to_json, :status => :unprocessable_entity
       end  

     }

     format.html{
      super
    } 
   end
  end
end