class Feedback < ActiveRecord::Base
  validates :email, presence: true
  validates :type_of_feedback, presence: true
  validates :summary, presence: true
      
end