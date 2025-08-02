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

    respond_to do |format|
      format.html 
      format.json
    end
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
  end

  def destroy
    parking_lot = ParkingLot.find(params[:id])
    parking_lot.destroy
    redirect_to parking_lots_path
  end

  private

  def parking_lot_params
    params.require(:parking_lot).permit(:genre_id, :parking_lot_name, :address, :fee, :description, :image)
  end
end
