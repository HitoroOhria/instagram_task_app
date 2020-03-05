require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do
  scenario "新規ユーザー登録に失敗する" do
    visit signup_url
    fill_in "Name",     with: ""
    fill_in "Email",    with: "tester@example.com"
    fill_in "Password", with: "foobar"
    fill_in "Confirmation", with: "foobar"
    
    expect{
      click_button "Create my account"
    }.to_not change(User, :count)
    
    expect(page).to have_content "Name can't be blank"
    expect(current_url).to eq users_url
  end
   
  scenario "新規ユーザー登録に成功する" do
    visit signup_url
    fill_in "Name",     with: "success user"
    fill_in "Email",    with: "success_user@example.com"
    fill_in "Password", with: "foobar"
    fill_in "Confirmation", with: "foobar"
    
    expect{
      click_button "Create my account"
    }.to change(User, :count).by(1)

    # expect(page).to have_content "Welcome to the Sample App!"
    # expect(page).to have_link "Log out"
    # expect(current_url).to eq users_url + "/#{User.find_by(name: "success user").id}"
    
  end
  
end
