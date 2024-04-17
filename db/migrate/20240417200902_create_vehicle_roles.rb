class CreateVehicleRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_roles do |t|

      t.timestamps
    end
  end
end
