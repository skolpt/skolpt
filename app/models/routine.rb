class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises
  
  accepts_nested_attributes_for :routine_exercises, :allow_destroy => true
  accepts_nested_attributes_for :exercises
end