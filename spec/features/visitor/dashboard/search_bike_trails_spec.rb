require 'rails_helper'

describe 'visitor visiting /dashboard' do
  scenario 'searches for mountain bike trails and conditions' do 

    activity = create(:activity)
    location = create(:location)

    json_response_mtb = File.open('./fixtures/bike_trails.json')
    stub_request(:get, "https://www.mtbproject.com/data/get-trails?lat=#{location.latitude}&lon=#{location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}").to_return(status: 200, body: json_response_mtb)
    
    json_response_weather = File.open('./fixtures/weather_forecast.json')
    stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{location.latitude},#{location.longitude}&days=5").to_return(status: 200, body: json_response_weather)
  
    visit '/'
    click_button 'Wander'

    expect(current_path).to eq(dashboard_path)
    
    select 'Breckenridge', from: :location_id
    select 'Mountain Biking', from: :activity_id
    click_button 'Search'

    expect(current_path).to eq(search_path)

    expect(page).to_not have_css('.gear-shop')

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
      expect(page).to have_content('Ascent')
      expect(page).to have_content('Descent')
      expect(page).to have_content('Highest Point')
      expect(page).to have_content('Lowest Point')
    end
  end
end