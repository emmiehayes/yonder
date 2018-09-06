class DashboardController < ApplicationController

  def show 
    @google_user = Google::UserSearch.new(current_user.oauth_token, current_user.username).find_user
  end
  
end
