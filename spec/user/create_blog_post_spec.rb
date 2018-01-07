require 'rails_helper'

feature 'Create blog post' do
  let(:password) {'foobar'}
  let(:email) {'foobar@example.com'}
  background do
    User.create(email: email,
                password: password,
                password_confirmation: password)
  end
  let(:title) {'DOTA2'}
  let(:subtitle) {'Best Game Ever'}
  let(:body) {'Learn more about this game here!'}
  let(:tag_list) {'DOTA2'}

  scenario 'with valid information' do
    visit login_path
    expect(page).to have_content 'Login'
    within ('form') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Login'
    visit new_article_path
    expect(page).to have_content 'Create A New Article'
    within('form') do
      fill_in 'Title', with: title
      fill_in 'Subtitle', with: subtitle
      fill_in 'Body', with: body
      fill_in 'Tag list', with: tag_list
      page.attach_file("article_image", Rails.root + 'spec/fixtures/dota2.jpg')
    end
    click_button 'Create Article'
    expect(page).to have_content 'You successfully created the article!'
  end
end
