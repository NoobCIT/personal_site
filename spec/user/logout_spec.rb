require 'rails_helper'

feature 'Logging out' do
  let(:password) {'foobar'}
  let(:email) {'foobar@example.com'}
  background do
    User.create(email: email,
                password: password,
                password_confirmation: password)
  end

  scenario 'Log out' do
    visit login_path
    expect(page).to have_button 'Login'
    within('form') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Login'
    expect(page).to have_content 'You have successfully logged in!'
    expect(page).to have_link 'Logout'
    click_link'Logout'
    expect(page).to have_content 'You have successfully logged out!'
  end
end
