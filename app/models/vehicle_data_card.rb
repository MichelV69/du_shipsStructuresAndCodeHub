class VehicleDataCard < ApplicationRecord
  belongs_to :user
  has_many :vehicle_roles, dependent: :destroy
  has_many :vehicle_features, dependent: :destroy

  CoreSizeList = ["--", "XS", "S", "M", "L"]

  def core_size_text
    return CoreSizeList[self.core_size]
  end

  def is_hybrid?
    is_hybrid = false || (self.env_atmosphere && self.env_space)
    return is_hybrid
  end
end
