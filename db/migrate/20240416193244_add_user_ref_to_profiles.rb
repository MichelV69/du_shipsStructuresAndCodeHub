class AddUserRefToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_reference :profiles, :user, index: true, null: false, foreign_key: true
  end

end
