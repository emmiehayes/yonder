require 'rails_helper'

describe 'visitor visiting dashboard_path' do
  scenario 'sees main activities' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        activity_1 = create(:activity)
        activity_2 = create(:activity)
        activity_3 = create(:activity)
        activity_4 = create(:activity)


    visit dashboard_path 

    expect(current_path).to eq('/dashboard')
    expect(page).to have_button(activity_1.title)
    expect(page).to have_button(activity_2.title)
    expect(page).to have_button(activity_3.title)
    expect(page).to have_button(activity_4.title)
 


  end
end