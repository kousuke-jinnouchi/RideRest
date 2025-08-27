class Public::CommentsController < ApplicationController

  def create
    @parking_lot = ParkingLot.find(params[:parking_lot_id])
    @comment = current_user.comments.new(comment_params)
    @comment.parking_lot_id = @parking_lot.id
    if @comment.save
      redirect_to parking_lot_path(@parking_lot), notice: 'レビューを投稿しました。'
    else
      render 'public/parking_lots/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy 
    redirect_to parking_lot_path(params[:parking_lot_id]), notice: 'レビューを削除しました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :score)
  end

end
