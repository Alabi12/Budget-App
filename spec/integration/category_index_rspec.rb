require 'rails_helper'

RSpec.describe 'Category Index', type: :system do
  before(:each) do
    @user = User.create(name: 'robert', email: 'wolo22001@gmail.com', password: '2e2010510',
                        password_confirmation: '2e2010510')
    @category = Category.create(user_id: @user.id, name: 'pizza', icon: 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
  end

  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    sleep(5)
  end

  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    sleep(4)
    click_button 'Log in'
    assert_text 'Categories'
    click_on 'Categories'
    sleep(2)
    click_link('Add a new category')

    fill_in 'Name', with: @category.name
    fill_in 'Icon', with: @category.icon
    click_button 'Add a new category'
  end
end
