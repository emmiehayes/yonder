require 'rails_helper'

describe 'visitor visiting "/"' do
  scenario 'sees a landing page' do

    visit '/'
    
    within(".navbar-menu") do
      expect(page).to have_button('Sign in with Google')
    end
  end
end
