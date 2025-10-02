class Public::FavoritesController < ApplicationController
  def create
    parking_lot = ParkingLot.find(params[:parking_lot_id])
    favorite = current_user.favorites.new(parking_lot_id: parking_lot.id)
    favorite.save
    redirect_to parking_lot_path(parking_lot)
  end

  def destroy
    parking_lot = ParkingLot.find(params[:parking_lot_id])
    favorite = current_user.favorites.find_by(parking_lot: parking_lot)
    favorite.destroy 
    redirect_to parking_lot_path(parking_lot)
  end
end
