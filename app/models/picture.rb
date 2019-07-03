class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event
  has_many :comments, dependent: :destroy
  validates :image_content, presence: true
  validates :image, presence: true
end
