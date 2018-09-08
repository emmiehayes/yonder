class DashboardController < ApplicationController

  def show 
    if current_user
     @user = User.find(current_user[:id])
    end
  end
end
