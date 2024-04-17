class User < ApplicationRecord
  include Clearance::User
  has_one :profile, dependent: :destroy
end
