class ParkingLotsController < ApplicationController
  def new
    @parking_lot = ParkingLot.new
  end

  def create
    @parking_lot = ParkingLot.new(parking_lot_params)
    @parking_lot.user_id = current_user.id 
    @parking_lot.save
    redirect_to parking_lots_path
  end

  def index
    @parking_lots = ParkingLot.all
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
  end

  private

  def parking_lot_params
    params.require(:parking_lot).permit(:genre_id, :parking_lot_name, :address, :fee, :description, :image)
  end
end
