require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "#index" do
    it "returns http status 302" do
      get :index
      expect(response).to have_http_status "302"
    end
  end
  
  describe "before action" do
    
    context "logged_in_user" do
      
      # it "work with edit action" do
      #   get :edit
      #   expect(flash[:danger]).to_not be_empty
      #   expect(response).to redirect_to login_url
      # end
      
      it "work with update action" do
        patch :update, params: {id: @user.id} 
        expect(flash[:danger]).to_not be_empty
        expect(response).to redirect_to login_url
      end
      
    end
    
  end

end
