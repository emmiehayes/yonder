require 'rails_helper'

describe 'user visiting their dashboard' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/dashboard'
  end

  scenario 'can successfully create an activity' do 
    expect(@user.activities.count).to eq(0)
    
    click_button 'Create Activity'
    
    expect(current_path).to eq(new_user_activity_path(@user))

    fill_in "activity_title", with: "rock climbing"
    fill_in "activity_high", with: "85"
    fill_in "activity_low", with: "60"
    select "Sunshine", :from => "activity_sky"
    click_on 'Save'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Activity successfully created.')
    expect(page).to have_button('rock climbing')
    expect(page).to have_button('Create Activity')
    expect(@user.activities.count).to eq(1)
  end

  scenario 'can make unsuccessful attempt to create new activity' do 
    expect(@user.activities.count).to eq(0)
  
    click_button 'Create Activity'
    fill_in "activity_title", with: "sky diving"
    fill_in "activity_high", with: "85"
    select "Sunshine", :from => "activity_sky"
    click_button 'Save'

    expect(page).to have_content('Missing required fields, activity was not created.')
    expect(page).to have_content('Create Activity')
    expect(@user.activities.count).to eq(0)
  end
end