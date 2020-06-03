require 'rails_helper'
RSpec.describe "DriversControllers", type: :request do
  

  describe "get drivers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:driver, 10)
      get drivers_path
      expect(response.status).to eq(200)
    end
  end
  
  describe "get driver_path" do
    it "renders the :show template" do
      driver = FactoryBot.create(:driver)
      get driver_path(id: driver.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the driver id is invalid" do
      get driver_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to drivers_path
    end
  end

   describe "get new_driver_path" do
    it "renders the :new template" do
      FactoryBot.create_list(:driver, 10)
      get new_driver_path
      expect(response.status).to eq(200)
   end
end
  
  describe "get edit_driver_path" do
    it "renders the :edit template" do 
    driver = FactoryBot.create(:driver)
    get edit_driver_path(id: driver.id)
    expect(response.status).to eq(200)
  end
end 

  describe "post drivers_path with invalid data" do
    it "does not save a new entry or redirect" do
      driver_attributes = FactoryBot.attributes_for(:driver)
      driver_attributes.delete(:first_name)
      expect { post drivers_path, {driver: driver_attributes}
    }.to_not change(Driver, :count)
      expect(response.status).to eq(302)
    end
  end


  describe "put driver_path with valid data" do
         it "updates an entry and redirects to the show path for the driver" do
            driver = FactoryBot.create(:driver, phone: "1234567890")
            expect(driver.phone).to eq("1234567890")
            put driver_path(driver), {driver: {phone: "1234567892"}}
            driver.reload
            expect(driver.phone).to eq("1234567892")
         end
  end

  describe "put driver_path with invalid data" do
         it "does not update the driver record or redirect" do
           driver = FactoryBot.create(:driver)
           put driver_path(id: driver.id),params:{driver:{phone:"1234"}}
           driver.reload
           expect(driver.phone).to_not eq("1234")
           expect(response.status).to eq(200)
         end
  end

  describe "delete a driver record" do
         it "deletes a driver record" do
            driver = FactoryBot.create(:driver)
            delete driver_path(driver.id)
            expect change(Driver, :count).from(1).to eq(0)
            expect(response.status).to eq(302)
         end
  end
end 


