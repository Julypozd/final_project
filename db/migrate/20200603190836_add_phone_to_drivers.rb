class AddPhoneToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :phone, :string
  end
end
