require 'rails_helper'

describe 'visitor visiting "/"' do
  it 'will see a landing page' do

    visit '/'

    expect(page).to have_content('YONDER')
    expect(page).to have_content('Go where the weather takes you.')
    expect(page).to have_button('Sign in with Google')
  end
end
