class DashboardController < ApplicationController

  def index
    user = User.new if current_user.nil?
    user = User.find(current_user[:id]) if current_user
  end

  def show 
    @presenter = SearchPresenter.new(params)
  end
end


