class ShipDataCard < ApplicationRecord
  belongs_to :user

  def core_size_text
    core_size_text = ["--", "XS", "S", "M", "L"]
    return core_size_text[self.core_size]
  end

  def is_hybrid?
    is_hybrid = false || (self.env_atmosphere && self.env_space)
    return is_hybrid
  end
end
