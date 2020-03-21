require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)  
  end
  
  describe "Comment Object" do
    
    it "is valid" do
      expect(@comment).to be_valid
    end
    
    it "is invalid with no user_id" do
      @comment.user_id = nil
      expect(@comment).to_not be_valid
    end
    
    it "is invalid with no micropost_id" do
        @comment.micropost_id = nil
        expect(@comment).to_not be_valid
      end
    
    context "Messagge" do
      
      it "is invalid with no message" do
        @comment.message = ""
        expect(@comment).to_not be_valid
      end
      
      it "is invalid with more than 140 strings" do
        @comment.message = "a" * 141
        expect(@comment).to_not be_valid
      end
      
    end
    
    context "default_scope" do
      
      it "最新のコメント順にモデルを取り出す" do
        other_comment = FactoryBot.create(:comment)
        expect(Comment.first).to eq other_comment
      end
      
    end
    
  end
  
end
