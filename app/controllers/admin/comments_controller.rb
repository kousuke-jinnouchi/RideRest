class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @comments = Comment.includes(:user, :parking_lot).order(created_at: :desc)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = "レビュー/コメントを削除しました。"
    redirect_to admin_comments_path
  end
end
