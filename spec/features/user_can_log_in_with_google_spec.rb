require 'rails_helper'

describe "user visiting root page" do
  scenario "can log in using google oauth2" do
    stub_omniauth

    visit root_path
    
    click_button "Sign in with Google"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Emmie Hayes")
    expect(page).to have_button("Sign Out")
  end
end