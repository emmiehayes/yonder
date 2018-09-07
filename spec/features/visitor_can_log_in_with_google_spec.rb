require 'rails_helper'

describe 'visitor visiting root page' do
  it 'can log in using google oauth2' do
    stub_omniauth

    expect(User.count).to eq(0)
    
    visit root_path

    click_button 'Sign in with Google'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Emmie Hayes')
    expect(page).to have_button('Sign Out')
    expect(User.count).to eq(1)
  end
end
