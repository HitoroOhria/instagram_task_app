require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelperHelper. For example:
#
# describe SessionsHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe "current_user" do
    before do
      @user = FactoryBot.create(:user)
      remember @user
    end
    
    it "is currect" do
      expect(@user).to eq current_user
      expect(session[:user_id].nil?).to eq false
    end
    
    it "is incurrect" do
      @user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to eq nil
    end
     
  end
end
