require 'rails_helper.rb'

RSpec.feature "イベント管理機能", type: :feature do

  before do
    visit root_path
    click_on "Sign up"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "Sign up"
     
    click_on "スケジュール"
    click_on "スケジュールを投稿"
    fill_in 'タイトル', with: 'test_title' 
    fill_in '内容', with: 'test_content' 
    fill_in 'event[start_at]', with: 'Thu, 30 Jun 2019 00:00:00 JST +09:00'
    fill_in 'event[end_at]', with: 'Thu, 31 Jun 2019 00:00:00 JST +09:00'
    select '完了', from: 'event_status'
    click_on "登録する"
  end

  scenario "写真の新規登録できること" do
    click_on "詳細"
    click_on "写真を投稿する"
    
    fill_in 'picture[image_content]', with: 'test_picture' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    click_on "登録する"
    expect(page).to have_content '画像を投稿しました！' 
  end


  scenario "写真の編集ができること" do
    click_on "詳細"
    click_on "写真を投稿する"
    
    fill_in 'picture[image_content]', with: 'test_picture' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    click_on "登録する"

    find('#settings_link').click
    fill_in 'picture[image_content]', with: 'edit_picture' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test2.jpg"
    click_on "編集する"
    expect(page).to have_content '投稿の編集をしました！'
    expect(page).to have_content 'edit_picture'
  end


  scenario "写真の削除ができること" do
    click_on "詳細"
    click_on "写真を投稿する"
    
    fill_in 'picture[image_content]', with: 'test_picture' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    click_on "登録する"

    find('#delete_link').click
    expect(page).to have_content '写真を削除しました'
  end
end
#save_and_open_page