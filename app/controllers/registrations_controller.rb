class RegistrationsController < Devise::RegistrationsController
  
  def create
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        @athlete = Athlete.create(athlete_params)
        @athlete.save ? (render :json => {:state => {:code => 0}, :data => @athlete }) : 
                     (render :json => {:state => {:code => 1, :messages => @athlete.errors.full_messages} })
      }
    end
  end

  private

  def athelete_params
    params.require(:athlete).permit(:email, :password)
  end
end 