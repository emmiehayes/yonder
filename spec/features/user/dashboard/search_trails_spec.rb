require 'rails_helper'

describe 'default user visiting /dashboard' do
  scenario 'searches for mountain bike trails, conditions & gear shops' do 
  
    user = create(:user)
    location = create(:location)

     5.times do 
      create(:trail)
    end 

     5.times do 
      create(:shop)
    end 

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    json_response_weather = File.open('./fixtures/weather_forecast.json')
    stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{location.latitude},#{location.longitude}&days=5").to_return(status: 200, body: json_response_weather)
      

    visit dashboard_path

    select 'Breckenridge', from: :location_id

    click_button 'Search'

    expect(current_path).to eq(search_path)

    expect(page).to have_css('#current-conditions', count: 1)

    within('#current-conditions') do
      expect(page).to have_content('Skies')
      expect(page).to have_content('Feels Like')
      expect(page).to have_content('Humidity')
      expect(page).to have_content('Winds')
      expect(page).to have_content('Precipitation')
    end
 
    expect(page).to have_css('.condition', count: 5)

    within(first('.condition')) do
      expect(page).to have_content('Date')
      expect(page).to have_content('Skies')
      expect(page).to have_content('Min')
      expect(page).to have_content('Max')
      expect(page).to have_content('Humidity')
      expect(page).to have_content('Max Winds')
    end
    
    expect(page).to have_css('.trail', count: 5)
    
    within(first('.trail')) do
      expect(page).to have_content('Location')
      expect(page).to have_content('Length')
      expect(page).to have_content('Highest Point')
      expect(page).to have_content('Lowest Point')
    end

    expect(page).to have_css('.gear-shop', count: 5)
    
    within(first('.gear-shop')) do
      expect(page).to have_content('Address')
      expect(page).to have_content('Phone')
      expect(page).to have_content('Price')
    end
  end
end