require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'title登録' do
    it 'titleが空だとバリデーションが通らない' do
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      event = Event.create(title:'',content:'test_content',start_at:'Thu, 30 Jun 2019 00:00:00 JST +09:00',end_at:'Thu, 31 Jun 2019 00:00:00 JST +09:00',status:'完了',user_id: @user.id)
      expect(event).not_to be_valid
    end

    it 'titleが空でなければバリデーションが通る' do
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      event = Event.create(title:'test',content:'test_content',start_at:'Thu, 30 Jun 2019 00:00:00 JST +09:00',end_at:'Thu, 31 Jun 2019 00:00:00 JST +09:00',status:'完了',user_id: @user.id)
      expect(event).to be_valid
    end
  end
end