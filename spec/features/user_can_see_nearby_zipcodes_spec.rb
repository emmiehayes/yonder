require 'rails_helper'

describe 'a user visiting their dashboard' do
  before :each do 
    @user = create(:user)
    @activity = @user.activities.create(title: 'Climbing', high: '80', low: '75', sky: 'Sunshine')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario 'clicks on an activity, confirms the preferences and sees unique locations that are nearby' do 
    
    visit dashboard_path

    within(".activity") do 
      click_button @activity.title
    end

    expect(current_path).to eq("/users/#{@user.id}/activities/#{@activity.id}")
    
    expect(page).to have_content("#{@activity.title}")
  
    expect(page).to have_content("High Temperature: #{@activity.high}")
    expect(page).to have_content("Low Temperature: #{@activity.low}")
    expect(page).to have_content("Sky: #{@activity.sky}")

    click_button 'Search'
  
    expect(page).to have_css(".location", count: 288)

    within(first(".location")) do
      expect(page).to have_content("City: ")
      expect(page).to have_content("State: ")
      expect(page).to have_content("Zip: ")
    end
  end
end 