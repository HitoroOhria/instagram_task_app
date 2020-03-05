require 'rails_helper'

RSpec.describe AccountActivationsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
end
