class User < ApplicationRecord
  include Clearance::User
  has_one :profile, dependent: :destroy
  has_many :vehicle_data_cards, dependent: :destroy
end
