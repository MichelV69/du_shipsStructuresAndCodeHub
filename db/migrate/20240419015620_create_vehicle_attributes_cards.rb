class CreateVehicleAttributesCards < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_attributes_cards do |t|
      t.integer :attribute_id
      t.string :attribute_description
      t.timestamps
    end
  add_reference :vehicle_attributes_cards, :vehicle_data_card, index: true, null: false, foreign_key: true
  end
end
