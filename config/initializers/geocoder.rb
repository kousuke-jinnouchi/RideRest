Geocoder.configure(
  lookup: :google,
  user_https: true,
  api_key: ENV["Geocoding_API_Key"],
  units: :km
)
