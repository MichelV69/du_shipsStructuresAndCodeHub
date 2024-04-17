class CreateTableVehicleRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_roles do |t|
      t.integer :design_id
      t.string :role_name
      t.text :role_description

      t.timestamps
    end
  end
end
