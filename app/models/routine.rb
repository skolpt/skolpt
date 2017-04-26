class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises
  
  accepts_nested_attributes_for :routine_exercises, :allow_destroy => true
  accepts_nested_attributes_for :exercises
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :difficulty, presence: true
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  
end