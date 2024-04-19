class VehicleDataCardsChangeColumnSpaceToEnvSpace < ActiveRecord::Migration[7.1]
  def change
    remove_column :vehicle_data_cards, :space, :boolean
    add_column :vehicle_data_cards, :env_space, :boolean
  end
end
