require 'rails_helper'

describe "user visiting root page" do
  scenario "can log in using google oauth2" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Google")
    
    click_link "Sign in with Google"

    expect(page).to have_content("Emmie Hayes")
    expect(page).to have_link("Sign Out")
  end
end