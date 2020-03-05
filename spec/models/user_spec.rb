require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.create(:user)
  end
  
  describe "User Object" do
    
    it "is valid" do
      expect(@user).to be_valid
    end
    
    context "User Name" do
      
      it "is invalid with empty" do
        @user.name = ""
        expect(@user).to_not be_valid
      end
      
      it "is invalid with more than 50 strings" do
        @user.name = "a" * 51
        expect(@user).to_not be_valid
      end
      
    end
    
    context "User Email" do
      
      it "is invalid with empty" do
        @user.email = ""
        expect(@user).to_not be_valid
      end
      
      it "is invalid with more than 225 strings" do
        @user.email = "a" * 244 + "@example.com"
        expect(@user).to_not be_valid
      end
      
      it "is valid with correct_combination" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                             first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_addres|
          @user.email = valid_addres
          puts "warning! [#{@user.email}] should valid" if @user.invalid?
          expect(@user).to be_valid
          # @user.valid?  ?  ( expect(@user).to be_valid ) : 
          #                  ( puts "#{@user.email} should valid" )
        end
      end
      
      it "is invalid with incorrect_combination" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        invalid_addresses.each do |invalid_addres|
          @user.email = invalid_addres
          puts "warning! [#{@user.email}] should invalid" if @user.valid?
          expect(@user).to_not be_valid
          # @user.valid?  ?  ( puts "#{@user.email} should invalid") :
          #                 ( expect(@user).to_not be_valid )
        end
      end
      
      it "is unique" do
        duplicate_user = @user.dup
        duplicate_user.email = duplicate_user.email.upcase
        expect(duplicate_user).to_not be_valid
      end
      
      it "is downcase by save DB" do
        @user.email = "Foo@ExAMPle.CoM"
        @user.save
        expect(@user.email.downcase).to eq @user.reload.email
      end
      
    end
    
    context "User Password" do
      
      it "is invlaid with empty" do
        @user.password = @user.password_confirmation = "" * 6
        expect(@user).to_not be_valid
      end
      
      it "is invlaid with less than 6 strings" do
        @user.password = @user.password_confirmation = "a" * 5
        expect(@user).to_not be_valid
      end
      
    end
    
  end
  
  describe "User has_many Micropost" do
    
    it "親userオブジェクトを削除すると、関連する子micropostオブジェクトも削除される" do
      FactoryBot.create(:micropost, user: @user)
      expect{
        @user.destroy
      }.to change(Micropost, :count).by(-1)
    end
    
  end
  
  describe "User methods" do
    
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }
    
    context "authenticated?" do
      
      it "return false for a user with nil digest" do
        expect(@user.authenticated?(:remember, '')).to eq false
      end
      
    end
    
    it "following?" do
      expect(user1.following?(user2)).to eq false
    end
    
    it "follow" do
      user1.follow(user2)
      expect(user1.following?(user2)).to eq true
    end
    
    it "unfollow" do
      user1.follow(user2)
      user1.unfollow(user2)
      expect(user1.following?(user2)).to eq false
    end
    
  end
  
end
