class Public::ParkingLotsController < ApplicationController
  before_action :is_maching_post_user, only: [:edit, :update, :destroy]
  before_action :set_all_tags, only: [:new, :edit, :create, :update]

  def new
    @parking_lot = ParkingLot.new
  end

  def create
    @parking_lot = ParkingLot.new(parking_lot_params)
    @parking_lot.user_id = current_user.id 
    if @parking_lot.save
      redirect_to parking_lots_path
    else
      render :new
    end
  end

  def index
    if params[:tag]
      @parking_lots = ParkingLot.tagged_with(params[:tag])
      @tag_name = params[:tag]
    else
      @parking_lots = ParkingLot.all
    end

    respond_to do |format|
      format.html 
      format.json
    end
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
    @comment = Comment.new
  end

  def edit 
    @parking_lot = ParkingLot.find(params[:id])
  end

  def update
    @parking_lot = ParkingLot.find(params[:id])
    if @parking_lot.update(parking_lot_params)
      redirect_to parking_lot_path(@parking_lot.id) 
    else
      render :edit
    end
  end

  def destroy
    parking_lot = ParkingLot.find(params[:id])
    parking_lot.destroy
    redirect_to parking_lots_path
  end

  private

  def parking_lot_params
    params.require(:parking_lot).permit(:genre_id, :parking_lot_name, :address, :fee, :description, :image, :latitude, :longitude, tag_list: [])
  end

  def is_maching_post_user
    @parking_lot = ParkingLot.find(params[:id])
    unless @parking_lot.user_id == current_user.id
      redirect_to parking_lots_path
    end
  end

  def set_all_tags
    @all_tags = ActsAsTaggableOn::Tag.all
  end
  
end
