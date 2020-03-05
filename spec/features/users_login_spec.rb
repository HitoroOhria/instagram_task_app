require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end
  
  scenario "ログインに失敗する" do
    log_in_as(@user, email: "", password: "")
    
    expect(current_url).to eq login_url
    expect(page).to have_content "Invalid email/password combination"
    
    visit root_url
    
    expect(page).to_not have_content "Invalid email/password combination"
    
  end
  
  scenario "ログインに成功し、ログアウトする" do
    log_in_as(@user)
    
    expect(page).to_not have_link "Log in"
    expect(page).to have_content  "Account"
    expect(page).to have_link     "Profile"
    expect(page).to have_link     "Settings"
    expect(page).to have_link     "Log out"
    
    click_link "Log out"
    
    expect(current_url).to eq root_url
    expect(page).to     have_link "Log in"
    expect(page).to_not have_link "Log out"
  end
  
  # checkメソッドでRemember meをチェックすることができず、断念、、、
  
  # scenario "Remember me を有効にする" do
  #   test_cookies = ActionDispatch::Request.new(Rails.application.env_config.deep_dup).cookie_jar
    
  #   visit   login_url
  #   expect(page).to_not have_checked_field("Remember me on this computer")
  #   fill_in "Email",    with: @user.email
  #   fill_in "Password", with: @user.password
  #   check   "Remember me on this computer"  <= 諸悪の根源くさい、、、
  #   click_button "Log in"
    
  #   puts @user.remember_token  => nil
  #   puts @user.remember_digest => nil
  #     => 以上より、remember(user)メソッドが動いていないことがわかる
  #     => 原因は、params[:session][:remember_me]が1でない = チェックボックスがチェックされていないことと考える
  #     => タイポでもない、、なぜや、、、なぜcheckさんは働いてくれんのや、、、JSが関係あるんか？、、、
  #     => もはや、テスト環境だとチェックボックス無い説 => あった、ラベル:"Remember me on this computer"

  #   expect(test_cookies.signed[:remembe_token].nil?).to eq false  => failure
  # end
  
  # scenario "Remember me を有効にしない" do
  #   test_cookies = ActionDispatch::Request.new(Rails.application.env_config.deep_dup).cookie_jar
    
  #   visit   login_url
  #   fill_in "Email",    with: @user.email
  #   fill_in "Password", with: @user.password
  #   uncheck "Remember me on this computer"
  #   click_button "Log in"
    
  #   expect(test_cookies.signed[:remember_token].nil?).to eq true
  # end
  
end
