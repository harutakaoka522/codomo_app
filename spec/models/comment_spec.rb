require "rails_helper"

RSpec.describe Comment, type: :model do
  describe 'comment登録時のバリデーション' do
    it 'コメント欄が空白だと投稿出来ない' do
      #comment = FactoryBot.build(:comment, content: '')
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      @event = Event.create(title:'test',content:'test_content',start_at:'Thu, 30 Jun 2019 00:00:00 JST +09:00',end_at:'Thu, 31 Jun 2019 00:00:00 JST +09:00',status:'完了',user_id: @user.id)
      @picture = Picture.create(image_content:'test_image_content',image:'#{Rails.root}/spec/features/test.jpg', event_id:@event.id)
      comment = Comment.create(picture_id:@picture.id,content:'',user_id: @user.id)
      expect(comment).not_to be_valid
    end

    it 'コメント欄が空白ではないと投稿出来る' do
      #comment = FactoryBot.build(:comment, content: '')
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      @event = Event.create(title:'test',content:'test_content',start_at:'Thu, 30 Jun 2019 00:00:00 JST +09:00',end_at:'Thu, 31 Jun 2019 00:00:00 JST +09:00',status:'完了',user_id: @user.id)
      @picture = Picture.create(image_content:'test_image_content',image:'#{Rails.root}/spec/features/test.jpg', event_id:@event.id)
      comment = Comment.create(picture_id:@picture.id,content:'test_comment',user_id: @user.id)
      expect(comment).to be_valid
    end
    
  end
end