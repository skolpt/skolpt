class FeedbacksController < ApplicationController
  
  def index
  
  end
  
  def new
    @feedback = Feedback.new
  end
  
end