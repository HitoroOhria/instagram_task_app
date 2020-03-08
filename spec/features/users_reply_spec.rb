require 'rails_helper'

RSpec.feature "UsersReplies", type: :feature do

  scenario "ユーザーがマイクポストにリプライする" do
    user = FactoryBot.create(:user)
    other_user = FactoryBot.create(:user)
    FactoryBot.create(:micropost, user: other_user)
    user.follow(other_user)
    
    log_in_as(user)
    visit root_url
    click_link "reply"
    fill_in "Message", with: "クソリプかますぜ！"
    
    expect{
      click_button "submit new comment"
    }.to change(Comment, :count).by(1)
    
    expect(page).to have_content "クソリプかますぜ！"
    expect(page).to have_link user.name
    expect(page).to have_link "delete"
    
  end
  
end
