class Exercise < ActiveRecord::Base
  searchable do
    text :name, :description
  end
  
  validates :name, presence: true, :uniqueness => true
  validates :description, presence: true
  validates :summary, presence: true
  validates :categories_id, presence: true
  validates :muscle_groups_id, presence: true
  
  belongs_to :user
  has_many :variations
  acts_as_votable
  
  default_scope { order(name: :asc)}
end