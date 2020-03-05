require 'rails_helper'

RSpec.feature "UsersFollows", type: :feature do
  before do
    @user1 = FactoryBot.create(:micropost).user
    @user2 = FactoryBot.create(:micropost).user
    @user3 = FactoryBot.create(:micropost).user
  end
  
  scenario "ユーザーをフォローしフィードを確認する" do
    @user1.follow(@user2)
    
    expect(@user1.feed).to include(@user2.microposts.first)
    expect(@user1.feed).to include(@user1.microposts.first)
    expect(@user1.feed).to_not include(@user3.microposts.first)
    
  end
  
end
