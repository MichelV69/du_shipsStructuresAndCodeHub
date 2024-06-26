class CreateVehicleFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_features do |t|
      t.integer :feature_id
      t.string :feature_description

      t.timestamps
    end
  add_reference :vehicle_features, :vehicle_data_card, index: true, null: false, foreign_key: true
  end
end
