require 'rails_helper'

describe 'user visiting user dashboard' do
  scenario 'it can see a map based on users location' do 
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path 

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content()
    
    
  end
  
end