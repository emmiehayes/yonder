require 'rails_helper'

describe 'default user visiting dashboard_path' do
  scenario 'can select a location and activity and see a list of trails nearby' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    activity_1 = create(:activity)
    activity_2 = create(:activity)
    location_1 = create(:location)
    location_2 = create(:location)
    
    visit dashboard_path 

    within("#select-preferences") do 
      select activity_1.title, selected: 'activity'
      select location_2.city, selected: 'location'
      click_on 'Trails Only'
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Trail Info")
    expect(page).to have_css(".trail", count: 5)

    within(first(".trail")) do
      expect(page).to have_content("Trail: Little Scraggy Trail Loop")
    end
  end
end