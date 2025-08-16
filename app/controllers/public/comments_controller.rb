class Public::CommentsController < ApplicationController

  def create
    parking_lot = ParkingLot.find(params[:parking_lot_id])
    comment = current_user.comments.new(comment_params)
    comment.parking_lot_id = parking_lot.id
    comment.save
    redirect_to parking_lot_path(parking_lot)
  end

  def destroy
    Comment.find(params[:id]).destroy 
    redirect_to parking_lot_path(params[:parking_lot_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
