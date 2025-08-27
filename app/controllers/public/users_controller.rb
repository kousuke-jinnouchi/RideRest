class Public::UsersController < ApplicationController
  before_action :is_maching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @parking_lots = @user.parking_lots
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'プロフィールを更新しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    if @user.update(is_active: false)
      reset_session
      flash[:notice] = "退会処理を実行いたしました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    else
      flash[:alert] = "退会処理に失敗しました。"
      render :unsubscribe
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_active)
  end
  
  def is_maching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to parking_lots_path
    end
  end

end
