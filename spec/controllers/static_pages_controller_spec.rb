require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "#home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "#help" do
    it "returns http success" do
      get :help
      expect(response).to be_success
    end
  end
  
  describe "#about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end
  
  describe "#Contact" do
    it "returns http success" do
      get :contact
      expect(response).to be_success
    end
  end
  
end
