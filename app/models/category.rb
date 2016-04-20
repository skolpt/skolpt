class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  
  has_many :exercises
  default_scope { order(name: :asc)}
end 