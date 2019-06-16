class Event < ApplicationRecord

    enum status: {'完了':0,'未完了':1}

    validate :start_at_cannot_be_in_the_past
    validates :title, presence: true
    validates :title, length: { maximum: 20 }  
    validates :content, presence: true
    validates :content, length: { maximum: 50 }  




    def start_at_cannot_be_in_the_past
      if start_at.present? && start_at > end_at
        errors[:base] << "無効なデータ入力です"
      end
    end
end
