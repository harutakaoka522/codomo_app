class Event < ApplicationRecord
    belongs_to :user
    has_many :pictures, inverse_of: :event, dependent: :destroy
    accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank

    enum status: {'完了':0,'未完了':1}

    validate :start_at_cannot_be_in_the_past
    validate :start_end_check
    validates :title, presence: true
    validates :title, length: { maximum: 20 }  
    validates :content, presence: true
    validates :content, length: { maximum: 50 }  
    validates :start_at, presence: true
    validates :end_at, presence: true

     def start_at_cannot_be_in_the_past
       if start_at.blank? || end_at.blank?
         return 'new'
       end
     end

    def start_end_check
      unless start_at.nil? || end_at.nil?
        errors.add(:終了日, "の日付を正しく記入してください。") unless
        self.start_at < self.end_at
      end
    end
end
