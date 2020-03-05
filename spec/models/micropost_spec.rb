require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @micropost = FactoryBot.create(:micropost, user: @user) 
  end
  
  describe "Micropost Object" do
    
    it "is valid" do
      expect(@micropost).to be_valid 
    end
    
    context "user.microposts method" do
      
      it "DBからmicropostオブジェクトを取り出す際、最も最近に作成された順から取り出す" do
        recent_micropost = FactoryBot.create(:micropost, :most_recent)
        expect(recent_micropost).to eq Micropost.first
      end
      
    end
    
    context "Micropost Context" do
      
      it "is invalid with no content" do
        @micropost.content = ""
        expect(@micropost).to_not be_valid
      end
      
      it "is invalid more than 140 string" do
        @micropost.content = "a" * 141
        expect(@micropost).to_not be_valid
      end
      
    end
    
    context "Micropost User_id" do
      
      it "is invald with no user_id" do
        @micropost.user_id = nil
        expect(@micropost).to_not be_valid
      end
      
    end
    
  end

end
