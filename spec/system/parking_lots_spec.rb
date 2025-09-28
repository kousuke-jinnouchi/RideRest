require 'rails_helper'

describe '投稿のテスト' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:parking_lot) { create(:parking_lot, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe "投稿画面のテスト" do
    before do
      visit new_parking_lot_path
    end
    context '表示の確認' do
      it 'new_parking_lot_pathが"/parking_lots/new"であるか' do
        expect(current_path).to eq('/parking_lots/new')
      end
      it '登録ボタンが表示されているか' do
        expect(page).to have_button '登録する'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'parking_lot[parking_lot_name]', with: Faker::Lorem.characters(number: 10) 
        fill_in 'parking_lot[address]', with: Faker::Address.full_address 
        fill_in 'parking_lot[latitude]', with: Faker::Address.latitude.to_d.round(6) 
        fill_in 'parking_lot[longitude]', with: Faker::Address.longitude.to_d.round(6) 
        fill_in 'parking_lot[fee]', with: Faker::Lorem.characters(number: 20) 
        fill_in 'parking_lot[description]', with: Faker::Lorem.characters(number: 30) 
        click_button '登録する'
        expect(page).to have_current_path parking_lots_path
      end
    end
  end

  describe "詳細画面のテスト" do
    context '投稿者本人がログインしているとき' do
      before do
        visit parking_lot_path(parking_lot)
      end

      it '削除リンクが存在しているか' do
        expect(page).to have_link 'この投稿を削除する'
      end

      it '編集リンクが存在しているか' do
        expect(page).to have_link 'この投稿を編集する'
      end
    end

    context 'リンクの遷移先の確認' do
      before do
        visit parking_lot_path(parking_lot)
      end
      
      it '編集の遷移先は編集画面か' do
        click_link 'この投稿を編集する'
        expect(current_path).to eq('/parking_lots/' + parking_lot.id.to_s + '/edit')
      end
    end
    
    context 'parking_lot削除のテスト' do
      before do
        visit parking_lot_path(parking_lot)
      end
      
      it 'parking_lotの削除' do
        expect{ parking_lot.destroy }.to change{ ParkingLot.count }.by(-1)
      end
    end

    context '他のユーザー or 未ログイン状態のとき' do
      before do
        click_link 'ログアウト'
        visit new_user_session_path
        fill_in 'user[email]', with: other_user.email
        fill_in 'user[password]', with: other_user.password
        click_button 'Log in'

        visit parking_lot_path(parking_lot)
      end

      it '削除リンクが表示されない' do
        expect(page).not_to have_link 'この投稿を削除する'
      end

      it '編集リンクが表示されない' do
        expect(page).not_to have_link 'この投稿を編集する'
      end
    end
  end

  describe '編集画面のテスト' do
    before do
      visit edit_parking_lot_path(parking_lot)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示(セット)されている' do
        expect(page).to have_field 'parking_lot[parking_lot_name]', with: parking_lot.parking_lot_name
        expect(page).to have_field 'parking_lot[address]', with: parking_lot.address
        expect(page).to have_field 'parking_lot[latitude]', with: parking_lot.latitude
        expect(page).to have_field 'parking_lot[longitude]', with: parking_lot.longitude
        expect(page).to have_field 'parking_lot[fee]', with: parking_lot.fee
        expect(page).to have_field 'parking_lot[description]', with: parking_lot.description
      end
      
      it '保存ボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end
    
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'parking_lot[parking_lot_name]', with: Faker::Lorem.characters(number: 10) 
        fill_in 'parking_lot[address]', with: Faker::Address.full_address 
        fill_in 'parking_lot[latitude]', with: Faker::Address.latitude.to_d.round(6) 
        fill_in 'parking_lot[longitude]', with: Faker::Address.longitude.to_d.round(6) 
        fill_in 'parking_lot[fee]', with: Faker::Lorem.characters(number: 20) 
        fill_in 'parking_lot[description]', with: Faker::Lorem.characters(number: 30) 
        click_button '登録する'
        expect(page).to have_current_path parking_lot_path(parking_lot)
      end
    end
  end
end