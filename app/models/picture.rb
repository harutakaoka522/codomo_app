class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event #, optional: true
  #belongs_to :user
end
