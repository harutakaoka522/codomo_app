class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event #, optional: true
  has_many :comments, dependent: :destroy
  #belongs_to :user
end
