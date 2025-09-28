
require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        user.name = ''
        is_expected.to eq false
      end
      it '20文字以下であること: 20文字は〇', spec_category: "バリデーションとメッセージ表示" do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×', spec_category: "バリデーションとメッセージ表示" do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '200文字以下であること: 200文字は〇', spec_category: "バリデーションとメッセージ表示" do
        user.introduction = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×', spec_category: "バリデーションとメッセージ表示" do
        user.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'ParkingLotモデルとの関係' do
      it '1:Nとなっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(User.reflect_on_association(:parking_lots).macro).to eq :has_many
      end
    end
  end
end
