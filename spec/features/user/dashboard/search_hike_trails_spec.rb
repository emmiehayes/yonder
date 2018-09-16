require 'rails_helper'

describe 'default user visiting /dashboard' do
  scenario 'searches for hiking trails, conditions & gear shops' do 
    
    user = create(:user)
    activity = create(:activity, title: "Trail Hiking")
    location = create(:location)
    term = 'outdoor gear'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    json_response_hike = File.open('./fixtures/hike_trails.json')
    stub_request(:get, "https://www.hikingproject.com/data/get-trails?lat=#{location.latitude}&lon=#{location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}").to_return(status: 200, body: json_response_hike)
    
    json_response_weather = File.open('./fixtures/weather_forecast.json')
    stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{location.latitude},#{location.longitude}&days=5").to_return(status: 200, body: json_response_weather)
    
    json_response_gear_hike = File.open('./fixtures/gear_shops_hike.json')
    stub_request(:get, "https://api.yelp.com/v3/businesses/search?latitude=#{location.latitude}&longitude=#{location.longitude}&limit=5&term=#{term}").to_return(status: 200, body: json_response_gear_hike)
  

    visit dashboard_path

    select 'Breckenridge', from: :location_id
    select 'Trail Hiking', from: :activity_id
    
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
      expect(page).to have_content('Ascent')
      expect(page).to have_content('Descent')
      expect(page).to have_content('Highest Point')
      expect(page).to have_content('Lowest Point')
    end
    
    expect(page).to have_css('.gear-shop', count: 5)

    within(first('.gear-shop')) do
      expect(page).to have_content('Rocky Mountain Underground')
      expect(page).to have_content('114 S Main St')
      expect(page).to have_content('+19704061209')
    end
  end
end