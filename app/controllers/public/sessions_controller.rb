# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    parking_lots_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
    unless user.is_active
      flash[:alert] = "あなたはすでに退会済みです。 再度ご登録をしてご利用ください。"
      redirect_to new_user_session_path
    end
  end
  
end
