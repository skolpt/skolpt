class AthletesController < ApplicationController
  
  def show
    @athlete = Athlete.find(params[:id])
  end
end