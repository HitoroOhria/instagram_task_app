require 'rails_helper'

RSpec.describe Relationship, type: :model do

  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    @relationship = FactoryBot.create(:relationship,
                                      follower_id: user1.id,
                                      followed_id: user2.id,)
  end
  
  describe "Relationship" do
    
    it "is valid" do
      expect(@relationship).to be_valid
    end
    
    it "is invalid with no follower_id" do
      @relationship.follower_id = nil
      expect(@relationship).to_not be_valid
    end
    
    
    it "is invalid with no followed_id" do
      @relationship.followed_id = nil
      expect(@relationship).to_not be_valid
    end
    
  end

end
