require 'rails_helper'

RSpec.feature "UsersEdit", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end
  
  scenario "ユーザ編集に失敗する" do
    log_in_as(@user)
    
    visit edit_user_url(@user)
    fill_in  "Name",         with: ""
    fill_in  "Email",        with: ""
    fill_in  "Password",     with: ""
    fill_in  "Confirmation", with: ""
    click_button "Save changes"
    
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Email is invalid"

  end
  
  scenario "ユーザ編集に成功する" do
    log_in_as(@user)
    
    visit edit_user_url(@user)
    fill_in  "Name",         with: "foobar"
    fill_in  "Email",        with: "foobar@edit.com"
    fill_in  "Password",     with: ""
    fill_in  "Confirmation", with: ""
    click_button "Save changes"
    
    expect(page).to have_content "Update your profile!"
    expect(current_url).to eq user_url(@user)
    @user.reload
    expect(@user.name).to  eq "foobar"
    expect(@user.email).to eq "foobar@edit.com"
    
  end
  
  scenario "間違ったユーザが編集しようとする" do
    log_in_as(@other_user)
    visit edit_user_url(@user)
    expect(current_url).to eq root_url
    
  end
  
end
