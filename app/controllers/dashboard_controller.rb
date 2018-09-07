class DashboardController < ApplicationController

  def show 
     @google_user = User.find(session[:id]) if current_user
  end
end
