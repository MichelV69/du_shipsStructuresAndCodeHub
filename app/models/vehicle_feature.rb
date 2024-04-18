class VehicleFeature < ApplicationRecord
  belongs_to :ship_data_card

  VehicleFeaturesList = {detailed_interior: 1, radar_atmo: 2, radar_space: 3, dsat: 4, warp_drive: 5,
    rocket_engines: 6, shields: 7, weapons:8, antigrav: 9, tile_scanner: 2}

  def set_feature_by_sym symbol
    self.feature_id = VehicleFeaturesList[symbol]
    if self.feature_id.nil?
      raise ArgumentError, "bad feature index [" + symbol.to_s + "]"
    end
  end
end
