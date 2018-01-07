require 'rails_helper'

feature 'Logging in' do
  let(:password) {'foobar'}
  let(:email) {'foobar@example.com'}
  background do
    User.create(email: email,
                password: password,
                password_confirmation: password)
  end

  scenario 'Log in with correct information' do
    visit login_path
    expect(page).to have_button 'Login'
    within('form') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Login'
    expect(page).to have_content 'You have successfully logged in!'
  end

  scenario 'Log out with incorrect information' do
    visit login_path
    expect(page). to have_button 'Login'
    within('form') do
      fill_in 'Email', with: "tutorial@example.org"
      fill_in 'Password', with: 'fizzbuzz'
    end
    click_button 'Login'
    expect(page).to have_content 'Invalid email/password combination.'
  end
end
