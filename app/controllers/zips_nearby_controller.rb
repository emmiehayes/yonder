class ZipsNearbyController < ApplicationController

  def index 
    @presenter = ZipsNearbyPresenter.new(current_zipcode)
  end
end