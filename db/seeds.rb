genre_monthly = Genre.find_or_create_by!(name: '月極')
genre_hourly = Genre.find_or_create_by!(name: '時間貸し')
genre_free = Genre.find_or_create_by!(name: '無料')
genre_registration = Genre.find_or_create_by!(name: '登録制')


tanaka = User.find_or_create_by!(email: 'tanaka@example.com') do |user|
  user.name = '田中 太郎'
  user.password = 'password'
  user.introduction = '都内を中心にバイクで移動しています。よろしくお願いします！'
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-user1.jpg')), filename: 'sample-user1.jpg')
end

suzuki = User.find_or_create_by!(email: 'suzuki@example.com') do |user|
  user.name = '鈴木 望'
  user.password = 'password'
  user.introduction = '週末ライダーです。便利な駐輪場情報、待ってます。'
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-user2.jpg')), filename: 'sample-user2.jpg')
end

sato = User.find_or_create_by!(email: 'sato@example.com') do |user|
  user.name = '佐藤 花子'
  user.password = 'password'
  user.introduction = '通勤でスクーターを使っています。'
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-user3.jpg')), filename: 'sample-user3.jpg')
end


ParkingLot.find_or_create_by!(address: '東京都中央区八重洲２丁目１') do |parking_lot|
  parking_lot.parking_lot_name = '東京駅八重洲口 バイク駐車場'
  parking_lot.latitude = 35.6798
  parking_lot.longitude = 139.7684
  parking_lot.fee = '120分 300円'
  parking_lot.description = '八重洲口すぐの好立地。商業施設利用に便利です。'
  parking_lot.user = tanaka
  parking_lot.genre = genre_hourly
  parking_lot.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-parking1.jpg')), filename: 'sample-parking1.jpg')
end

ParkingLot.find_or_create_by!(address: '東京都千代田区大手町２丁目３−４') do |parking_lot|
  parking_lot.parking_lot_name = '大手町プレイス バイク駐車場'
  parking_lot.latitude = 35.6874
  parking_lot.longitude = 139.766
  parking_lot.fee = '月額 15,000円'
  parking_lot.description = 'オフィス街へのアクセス抜群。通勤利用に最適です。'
  parking_lot.user = suzuki
  parking_lot.genre = genre_monthly
  parking_lot.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-parking2.jpg')), filename: 'sample-parking2.jpg')
end

ParkingLot.find_or_create_by!(address: '東京都千代田区丸の内１丁目８−１') do |parking_lot|
  parking_lot.parking_lot_name = '丸の内トラストタワーN館 駐車場'
  parking_lot.latitude = 35.682
  parking_lot.longitude = 139.769
  parking_lot.fee = '無料（施設利用者のみ）'
  parking_lot.description = 'ビル利用者向けの無料駐輪スペースです。登録が必要な場合があります。'
  parking_lot.user = sato
  parking_lot.genre = genre_free
  parking_lot.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-parking3.jpg')), filename: 'sample-parking3.jpg')
end

ParkingLot.find_or_create_by!(address: '東京都千代田区丸の内２丁目７−２') do |parking_lot|
  parking_lot.parking_lot_name = 'JPタワー（KITTE）駐車場'
  parking_lot.latitude = 35.6804
  parking_lot.longitude = 139.765
  parking_lot.fee = '60分 200円'
  parking_lot.description = '東京駅直結。雨の日でも濡れずにアクセス可能です。'
  parking_lot.user = tanaka
  parking_lot.genre = genre_hourly
  parking_lot.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/fixtures/sample-parking4.jpg')), filename: 'sample-parking4.jpg')
end

puts 'シードデータの投入完了' 