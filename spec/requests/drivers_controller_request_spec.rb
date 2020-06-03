require 'rails_helper'
RSpec.describe "DriversControllers", type: :request do
  
  describe "get drivers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:driver, 5)
      get customers_path
      expect(response.status).to eq(200)
    end
  end
  
end