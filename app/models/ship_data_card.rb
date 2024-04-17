class ShipDataCard < ApplicationRecord
  belongs_to :user

  def core_size_text
    core_size_text = ["--", "XS", "S", "M", "L"]
    return core_size_text[self.core_size]
  end
end
