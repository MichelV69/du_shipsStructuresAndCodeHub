class CreateTableVehicleRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_roles do |t|
      t.integer :role_id
      t.string :role_description

      t.timestamps
    end
    add_reference :vehicle_roles, :vehicle_data_card, index: true, null: false, foreign_key: true
  end
end
