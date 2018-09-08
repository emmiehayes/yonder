require 'rails_helper'

describe 'user visiting their dashboard' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/dashboard'
  end

  scenario 'sees basic profile information' do 
    expect(page).to have_content(@user.first_name)
  end

  scenario 'can create an activity' do 
    expect(@user.activities.count).to eq(0)
    
    click_button 'Create Activity'
    
    expect(current_path).to eq(new_user_activities_path(@user))

    within(".activity_form") do
      fill_in :name, with: 'Rock Climbing'
      fill_in :high, with: '85'
      fill_in :low, with: '50'
      fill_in :sky, with: 'sunny'
      click_on 'Save Activity'
    end 

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_button('Rock_Climbing')
    expect(page).to have_button('Create_Activity')
    expect(@user.activities.count).to eq(1)
  end
end