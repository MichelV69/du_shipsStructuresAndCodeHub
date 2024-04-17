class VehicleRole < ApplicationRecord
  belongs_to :ship_data_card

  def set_role_by_sym symbol
    roles_list = {pvp_combat: 1, pve_combat: 2, hauler: 3, courier: 4, carrier: 5, racer: 6, pocket: 7, prospector: 8, tile_scanner: 9 }
    self.role_name = roles_list[symbol]
  end
end
