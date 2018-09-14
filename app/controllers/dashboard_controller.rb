class DashboardController < ApplicationController

  def index
    @user = User.find(current_user[:id])
  end

  def show 
    @presenter = SearchPresenter.new(params)
  end
end


