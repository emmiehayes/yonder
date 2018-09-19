require 'rails_helper'

describe 'logged in user' do
  scenario 'can visit the trail show page and enter a phone number to invite a friend' do

    @user = create(:user)
    @location = create(:location)
    @trail = create(:trail)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    json_response_weather = File.open('./fixtures/weather_forecast.json')
    stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{@location.latitude},#{@location.longitude}&days=5").to_return(status: 200, body: json_response_weather)
 
    message = "Emmie has invited you to ride #{@trail.name} in #{@trail.location}!"
    call_hash = {from: '+19783103925', to: "", body: message}

    allow_any_instance_of(Twilio::REST::Api::V2010::AccountContext::MessageList).to receive(:create).with(call_hash)

    visit dashboard_path

    select 'Breckenridge', from: :location_id

    click_button 'Search'

    expect(current_path).to eq(search_path)

    click_link "#{@trail.name}"

    expect(current_path).to eq(trail_path(@trail))
    expect(page).to have_content(@trail.name)
    expect(page).to have_content(@trail.location)
    expect(page).to have_content('Invite a Friend')
    expect(page).to have_content('Enter phone number below to send a text')

    fill_in :current_user_phone_number, with: ENV["TWILIO_TO_PHONE"]
    click_button 'Submit'

    expect(current_path).to eq(trail_path(@trail))
    end
  end