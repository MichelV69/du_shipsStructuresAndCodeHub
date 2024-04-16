class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :discord_id
      t.string :steam_id
      t.string :du_charname

      t.timestamps
    end

    add_index :profiles, :discord_id
    add_index :profiles, :steam_id
  end
end
