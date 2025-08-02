json.data do
  json.items do
    json.array!(@parking_lots) do |parking_lot|
      json.id parking_lot.id
      json.user do
        json.name parking_lot.user.name
        json.image url_for(parking_lot.user.profile_image)
      end
      json.image url_for(parking_lot.image)
      json.parking_lot_name parking_lot.parking_lot_name
      json.description parking_lot.description
      json.address parking_lot.address
      json.fee parking_lot.fee
      json.latitude parking_lot.latitude.to_f
      json.longitude parking_lot.longitude.to_f
    end
  end
end