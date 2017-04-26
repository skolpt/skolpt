class RoutineExercise < ActiveRecord::Base
  belongs_to :routine
  belongs_to :exercise
  
  accepts_nested_attributes_for :exercise
  
  validates :sets, presence: true, length: { maximum: 4 }
  validates :reps, presence: true, length: { maximum: 4 }
end