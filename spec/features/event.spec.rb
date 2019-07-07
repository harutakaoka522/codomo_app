require 'rails_helper.rb'

RSpec.feature "スケジュール管理機能", type: :feature do

  before do
    visit root_path
    click_on "Sign up"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "Sign up"
   #@user = User.create(name: '', email: 'aaa@gmail.com', password: 'password',password_confirmation: 'password')
    
  end

  scenario "スケジュールの新規登録できること" do
    
  visit events_path
  click_on "スケジュールを投稿"

  fill_in 'タイトル', with: 'test_title' 
  fill_in '内容', with: 'test_content' 
  fill_in 'event[start_at]', with: 'Thu, 30 Jun 2019 00:00:00 JST +09:00'
  fill_in 'event[end_at]', with: 'Thu, 31 Jun 2019 00:00:00 JST +09:00'
  select '完了', from: 'event_status'
  click_on "登録する"

  expect(page).to have_content 'test_title'
  end

  scenario "スケジュールが確認および編集できること" do
    
  visit events_path
  click_on "スケジュールを投稿"
  
  fill_in 'タイトル', with: 'test_title' 
  fill_in '内容', with: 'test_content' 
  fill_in 'event[start_at]', with: 'Thu, 30 Jun 2019 00:00:00 JST +09:00'
  fill_in 'event[end_at]', with: 'Thu, 31 Jun 2019 00:00:00 JST +09:00'
  select '完了', from: 'event_status'
  
  click_on "登録する"  
  click_on "詳細"
  click_on "編集"

  select '未完了', from: 'event_status'
  click_on "編集する"
  expect(page).to have_content '未完了'
  end

  scenario "スケジュールが削除できること" do

  visit events_path
  click_on "スケジュールを投稿"
  
  fill_in 'タイトル', with: 'test_title' 
  fill_in '内容', with: 'test_content' 
  fill_in 'event[start_at]', with: 'Thu, 30 Jun 2019 00:00:00 JST +09:00'
  fill_in 'event[end_at]', with: 'Thu, 31 Jun 2019 00:00:00 JST +09:00'
  select '完了', from: 'event_status'
  
  click_on "登録する"  
  click_on "詳細"
  click_on "削除"
  
  expect(page).not_to have_content 'test_title'
  end
end

#save_and_open_page