require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'image登録' do
    it '写真欄が空白だと投稿出来ない' do
      #comment = FactoryBot.build(:comment, content: '')
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      @event = Event.create(title:'test',content:'test_content',start_at:'Thu, 30 Jun 2019 00:00:00 JST +09:00',end_at:'Thu, 31 Jun 2019 00:00:00 JST +09:00',status:'完了',user_id: @user.id)
      picture = Picture.create(image_content:'test_image_content',image:'', event_id:@event.id)
      expect(picture).not_to be_valid
    end
  end
end