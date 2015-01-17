require 'rails_helper'

feature 'User managment' do 

  scenario "add new user" do
       expect{
    visit new_user_path
    fill_in 'user_user_name', with: attributes_for(:user)[:user_name]
    fill_in 'user_email', with: attributes_for(:user)[:email]
    fill_in 'user_password', with: attributes_for(:user)[:password]

    click_button 'create_user'
    }.to change(User, :count).by(1)

  end
end
