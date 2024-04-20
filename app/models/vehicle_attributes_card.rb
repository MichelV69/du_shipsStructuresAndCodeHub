class VehicleAttributesCard < ApplicationRecord
  belongs_to  :vehicle_data_card

  VehicleAttributesList = { common_dry_weight: 1, common_cargo_space: 2,
      atmosphere_cargo_lift_1g: 3, atmosphere_max_speed_kmh: 4, atmosphere_hover_power_mn: 5,
      atmosphere_sustentation_speed_kmh: 6, atmosphere_thrust_mn: 7, atmosphere_brake_mn: 8,
      atmosphere_wing_lift_mn: 9, atmosphere_fuel_kl: 10,
      space_thrust_mn: 11, space_brake_mn: 12, space_hover_mn: 13, space_fuel_kl: 14}

  def set_attr_by_sym symbol
    self.attribute_id = VehicleAttributesCard::VehicleAttributesList[symbol]
    if self.attribute_id.nil?
      raise ArgumentError, "bad attribute index [" + symbol.to_s + "]"
    end
  end

end
