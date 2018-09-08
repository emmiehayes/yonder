require 'rails_helper'

describe 'visitor visiting root page' do
  scenario 'logs in and out using google oauth2' do
    stub_omniauth

    expect(User.count).to eq(0)
    
    visit root_path

    click_button 'Sign in with Google'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Emmie')
    expect(page).to have_button('Sign Out')
    expect(User.count).to eq(1)

    click_button 'Sign Out'

    expect(current_path).to eq('/')
    expect(page).to_not have_content('Emmie')
    expect(page).to_not have_button('Sign Out')
  end
end
