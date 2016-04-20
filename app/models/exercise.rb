class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :categories_id, presence: true
  validates :muscle_groups_id, presence: true
  
  belongs_to :user
  acts_as_votable
  
  default_scope { order(name: :asc)}
end