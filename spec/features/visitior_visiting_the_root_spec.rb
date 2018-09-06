require 'rails_helper'

describe 'registration workflow' do
  it 'submits registration succesfully' do

    name = 'Emmie'
    email_address = 'Emmie@google.com'
    password = 'passwordEmmie'

    visit '/'
    click_on 'Register'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email_address
    fill_in 'user[password]', with: password
    click_on 'Submit'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Logged in as: #{User.last.name}")
  end
end
