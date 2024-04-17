class VehicleRole < ApplicationRecord
  belongs_to :ship_data_card

  def set_role_by_sym symbol
    roles_list = {combat: 1, Hauler: 2, Courier: 3, Carrier: 4, Racer: 5, Pocket: 6}
    self.role_name = roles_list[symbol]
  end
end
