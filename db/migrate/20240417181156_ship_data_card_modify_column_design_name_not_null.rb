class ShipDataCardModifyColumnDesignNameNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:ship_data_cards, :design_name, false)
  end
end
