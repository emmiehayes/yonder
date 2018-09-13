class DashboardController < ApplicationController

  def index
    if current_user
      @user = User.find(current_user[:id])
    end
  end

  def show 
    @presenter = SearchPresenter.new(params)
  end
end


