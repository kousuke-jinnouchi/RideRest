# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Paking_lotモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { parking_lot.valid? }

    let(:user) { create(:user) }
    let!(:parking_lot) { build(:parking_lot, user_id: user.id) }

    context 'parking_lot_nameカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.parking_lot_name = ''
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.address = ''
        is_expected.to eq false
      end
    end

    context 'latitudeカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.latitude = ''
        is_expected.to eq false
      end
    end

    context 'longitudeカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.longitude = ''
        is_expected.to eq false
      end
    end

    context 'feeカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.fee = ''
        is_expected.to eq false
      end
    end

    context 'descriptionカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        parking_lot.description = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(ParkingLot.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
