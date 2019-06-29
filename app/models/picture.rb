class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event
  has_many :comments, dependent: :destroy

  # after_create :picture_presence
 validates :image_content, presence: true, length: { minimum: 1, maximum: 50 }
 validates :image, presence: true
end
