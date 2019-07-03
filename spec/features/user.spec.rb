require 'rails_helper.rb'

RSpec.feature "ユーザー管理機能", type: :feature do

  before do
    visit root_path
  end

  scenario "新規登録できること" do
    
    click_on "Sign up"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "Sign up"
    expect(page).to have_content 'アカウント登録が完了しました。' 
  end

  scenario "ログアウト出来ること" do
    click_on "Sign up"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "Sign up"
    click_on "ログアウト"
    
    expect(page).to have_content 'CODOMO scheduler'
  end

  scenario "ユーザー情報が編集できること" do
    click_on "Sign up"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "Sign up"
    click_on "プロフィール変更"

    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: '111111'
    fill_in 'user[password_confirmation]', with: '111111'
    
    fill_in 'user[current_password]', with: 'password' 
    
    click_on "更新"
    expect(page).to have_content 'アカウント情報を変更しました。' 
  end
end

#save_and_open_page