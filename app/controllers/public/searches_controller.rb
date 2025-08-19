class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @content = params[:content]
    @results = ParkingLot.search_for(@content)
  end
end
