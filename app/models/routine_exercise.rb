class RoutineExercise < ActiveRecord::Base
  belongs_to :routine
  belongs_to :exercise
  
  accepts_nested_attributes_for :exercise
end