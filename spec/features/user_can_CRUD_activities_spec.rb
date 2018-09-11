require 'rails_helper'

describe 'user visiting their dashboard' do
  before :each do
    @user = create(:user)
    @activity = @user.activities.create(title: 'Climbing', high: '80', low: '75', sky: 'Sunshine')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/dashboard'
  end

  scenario 'can successfully create and delete an activity' do
    title = 'Skiing'
    high = '60'
    low = '39'
    sky = 'Snow' 

    expect(@user.activities.count).to eq(1)
    
    click_button 'Create Activity'

    expect(current_path).to eq(new_user_activity_path(@user))
    fill_in "activity_title", with: title
    fill_in "activity_high", with: high
    fill_in "activity_low", with: low
    select sky, :from => 'activity_sky'
    click_on 'Save'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Activity successfully created.')
    expect(page).to have_button(@user.activities.first.title)
    expect(@user.activities.count).to eq(2)

    click_button title 

    expect(current_path).to eq(user_activity_path(@user, @user.activities.second))
    expect(page).to have_content(@user.activities.second.title)
    expect(page).to have_content("High Temperature: #{@user.activities.second.high}")
    expect(page).to have_content("Low Temperature: #{@user.activities.second.low}")
    expect(page).to have_content("Sky: #{@user.activities.second.sky}")

    click_button 'Delete'

    expect(current_path).to eq(dashboard_path)
    expect(@user.activities.count).to eq(1)
    expect(@user.activities.include?('Skiing')).to eq(false)
    expect(page).to have_content("Successfully deleted Skiing activity.")
  end

  scenario 'can make unsuccessful attempt to create new activity' do 
    expect(@user.activities.count).to eq(1)
  
    click_button 'Create Activity'
    fill_in "activity_title", with: @user.activities.first.title
    fill_in "activity_high", with: @user.activities.first.high
    select @user.activities.first.sky, :from => "activity_sky"
    
    click_button 'Save'

    expect(page).to have_content('Missing required fields, activity was not created.')
    expect(page).to have_content('Create Activity')
    expect(@user.activities.count).to eq(1)
  end

  scenario 'can update an activity' do 
    update_title = 'Rock climbing'
    update_high = '90'

      click_button @activity.title
  
      click_button 'Edit'

      fill_in "activity_title", with: update_title
      fill_in "activity_high", with: update_high

      click_button 'Save'

    expect(page).to have_content(update_title)
    expect(page).to have_content("High Temperature: #{update_high}")
    expect(page).to have_content("Low Temperature: #{@activity.low}")
    expect(page).to have_content("Sky: #{@activity.sky}")
  end

  scenario 'can make unsuccessful attempt to update an activity' do 
    update_title = 'Rock climbing'
    update_high = nil

      click_button @activity.title
  
      click_button 'Edit'

      fill_in "activity_title", with: update_title
      fill_in "activity_high", with: update_high

      click_button 'Save'

    expect(page).to have_content('Missing required fields, activity was not updated.')
    expect(page).to have_content('Edit Activity')
  end
end