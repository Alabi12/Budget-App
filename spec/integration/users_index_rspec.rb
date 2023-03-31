require 'rails_helper'

RSpec.feature 'Budget Lines Home Page', type: :feature do
  scenario 'displays the home page' do
    visit root_path
    expect(page).to have_css('.home-section')
    expect(page).to have_css('.home-section-text')
    expect(page).to have_css('h1.home-heading', text: 'Budget Lines')
    expect(page).to have_link('Log in', href: new_user_session_path)
    expect(page).to have_link('Sign up', href: new_user_registration_path)
  end

  describe 'check the content and link for the user index page' do
    before(:each) do
      @user = User.create(name: 'alabi', email: 'wolo2201@gmail.com', password: '22010510')

      visit user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
    end

    it 'User should see the user Login' do
      expect(page).to have_content('LOGIN')
    end

    it 'User should see the user Login button' do
      expect(page).to have_content('Forgot your password?')
    end
  end
end
