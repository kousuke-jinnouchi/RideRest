class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(is_active: !@user.is_active)
      flash[:success] = "ユーザーステータスを更新しました。"
      redirect_to admin_user_path(@user)
    else
      flash[:danger] = "更新に失敗しました。"
      render :show
    end
  end

end
