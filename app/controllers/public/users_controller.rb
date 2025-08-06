class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parking_lots = @user.parking_lots
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
  
end
