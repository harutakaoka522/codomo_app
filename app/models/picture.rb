class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event #, optional: true
  has_many :comments, dependent: :destroy
  validates :image_content, presence: true, length: { minimum: 1, maximum: 50 }
  #belongs_to :user
end
