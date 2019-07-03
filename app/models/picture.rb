class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event
  has_many :comments, dependent: :destroy
  # before_create :scheduler_end

  # after_create :picture_presence
 validates :image_content, presence: true
 validates :image, presence: true
 

  # def scheduler_end
  #   if event.status == "未完了"
  #     errors.add :base, 'スケジュールが未完了です'
  #     throw :abort

  #    # redirect_to event, notice: '未完了はダメです'
  #    # redirect_to
  #   end
  # end
end
