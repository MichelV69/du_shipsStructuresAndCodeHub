class VehicleRole < ApplicationRecord
  belongs_to :ship_data_card

  VehicleRolesList =  {pvp_combat: 1, pve_combat: 2, hauler: 3, courier: 4, carrier: 5,
    racer: 6, pocket: 7, prospector: 8, tile_scanner: 9}

  def set_role_by_sym symbol
    self.role_name = VehicleRole::VehicleRolesList[symbol]
    if self.role_name.nil?
      raise ArgumentError, "bad role index [" + symbol.to_s + "]"
    end
  end
end
