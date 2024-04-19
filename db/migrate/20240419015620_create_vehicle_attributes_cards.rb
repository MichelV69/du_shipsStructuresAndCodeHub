class CreateVehicleAttributesCards < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_attributes_cards do |t|

      t.timestamps
    end
  end
end
