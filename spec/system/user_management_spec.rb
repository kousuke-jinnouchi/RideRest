require 'rails_helper'

RSpec.describe 'ユーザー管理', type: :system do
  let!(:user) { create(:user) }

  describe 'ユーザー登録' do
    before { visit new_user_registration_path }

    it '登録フォームが表示されること' do
      expect(page).to have_content 'Sign up'
      expect(page).to have_field 'user[name]'
      expect(page).to have_field 'user[email]'
      expect(page).to have_field 'user[password]'
      expect(page).to have_field 'user[password_confirmation]'
      expect(page).to have_button 'Sign up'
    end

    context '有効な入力の場合' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end
      it '正しく新規登録される' do
        expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、投稿一覧画面になっている' do
        click_button 'Sign up'
        expect(current_path).to eq '/parking_lots'
        expect(page).to have_content 'Welcome! You have signed up successfully.'
      end
    end

    context '無効な入力の場合' do
      it '新しいユーザーが登録されないこと' do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: 'invalid_email'
        fill_in 'user[password]', with: 'short'
        fill_in 'user[password_confirmation]', with: 'mismatch'
        expect { click_button 'Sign up' }.not_to change(User, :count)
      end
    end
  end

  describe 'ユーザーログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    it 'ログインフォームが表示されること' do
      expect(page).to have_content 'Log in'
      expect(page).to have_field 'user[email]'
      expect(page).to have_field 'user[password]'
      expect(page).to have_button 'Log in'
    end

    context '有効な認証情報の場合' do
      it 'ユーザーがログインされること' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        expect(current_path).to eq '/parking_lots'
        expect(page).to have_content 'Signed in successfully.'
      end
    end

    context '無効な認証情報の場合' do
      it 'ユーザーがログインされないこと' do
        fill_in 'user[email]', with: 'wrong_user'
        fill_in 'user[password]', with: 'wrong_password'
        click_button 'Log in'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'ユーザーログアウト' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it 'ユーザーがログアウトされること' do
      click_link 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_content 'Signed out successfully.'
    end
  end
end