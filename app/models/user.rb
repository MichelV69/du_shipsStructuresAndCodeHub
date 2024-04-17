class User < ApplicationRecord
  include Clearance::User
  has_one :profile, dependent: :destroy
  has_many :ship_data_cards, dependent: :destroy
end
