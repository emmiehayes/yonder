require 'rails_helper'

describe 'a visitor or user visiting "/"' do
  scenario 'has the option to wander or sign in via google' do
    visit '/'
    
    within(".navbar-menu") do
      expect(page).to have_button('Sign in with Google')
      expect(page).to have_button('Wander')
    end
  end
end
