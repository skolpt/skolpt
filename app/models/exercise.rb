class Exercise < ActiveRecord::Base
  #searchable do
  #  text :name, :description
  #end
  extend FriendlyId
  friendly_id :name
  
  validates :name, presence: true, :uniqueness => true
  validates :description, presence: true
  validates :setup, presence: true
  validates :summary, presence: true
  validates :categories_id, presence: true
  validates :muscle_groups_id, presence: true
  mount_uploader :picture, PictureUploader #Conventional format of uploading images
  validate :picture_size #private method to detect the file size
  
  belongs_to :user
  has_many :variations
  acts_as_votable
  
  default_scope { order(name: :asc)}
  
  # Search Definition to be able to filter out results
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
  private 
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Should be less than 5MB")
      end
    end
end