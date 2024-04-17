class ShipDataCardsChangeColumnSpaceToEnvSpace < ActiveRecord::Migration[7.1]
  def change
    remove_column :ship_data_cards, :space, :boolean
    add_column :ship_data_cards, :env_space, :boolean
  end
end
