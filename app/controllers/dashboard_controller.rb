class DashboardController < ApplicationController

  def show 
    @google_user = User.find(session[:id])
  end
end
