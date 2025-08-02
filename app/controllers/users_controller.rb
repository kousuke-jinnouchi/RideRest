class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_active)
  end
  
end
