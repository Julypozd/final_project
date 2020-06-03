class RemovePhoneFromDrivers < ActiveRecord::Migration[5.0]
  def change
    remove_column :drivers, :phone, :integer
  end
end
