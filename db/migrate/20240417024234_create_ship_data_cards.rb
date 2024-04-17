class CreateShipDataCards < ActiveRecord::Migration[7.1]
  def change
    create_table :ship_data_cards do |t|
      t.integer :user_id
      t.string  :design_name
      t.integer :price_blueprint
      t.integer :price_token
      t.integer :core_size
      t.boolean :env_atmosphere
      t.boolean :env_ground
      t.boolean :space

      t.timestamps
    end
  end
end
