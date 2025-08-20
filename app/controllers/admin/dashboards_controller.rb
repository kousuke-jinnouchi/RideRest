class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @total_users = User.count
    @active_users = User.where(is_active: true).count
    @withdrawn_users = User.where(is_active: false).count
    @total_parking_lots = ParkingLot.count
  end
end
