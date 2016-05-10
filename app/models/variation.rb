class Variation < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :exercise_id, presence: true
  
  belongs_to :exercises
  default_scope { order(name: :asc)}
end