FactoryBot.define do
  factory :parking_lot do
    parking_lot_name { Faker::Lorem.characters(number: 10) }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude.to_d.round(6) }
    longitude { Faker::Address.longitude.to_d.round(6) }
    fee { Faker::Lorem.characters(number: 20) }
    description { Faker::Lorem.characters(number: 30) }
    user
  end
end