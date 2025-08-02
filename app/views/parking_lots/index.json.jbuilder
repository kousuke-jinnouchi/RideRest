json.data do
  json.items do
    json.array!(@parking_lots) do |parking_lot|
      json.id paking_lot.id
      json.user do
        json.name parking_lot.user.name
        json.image url_for(parking_lot.user.profile_image)
      end
      json.image url_for(paking_lot.image)
      json.parking_lot_name parking_lot.parking_lot_name
      json.description paking_lot.description
      json.address paking_lot.address
      json.latitude parking_lot.latitude
      json.longitude parking_lot.longitude
    end
  end
end