require "test_helper"

class VehicleFeatureTest < ActiveSupport::TestCase
  setup do
    @u = User.new
    @u.email = "vrt_email@example.com"
    @u.password = "cleverPWD"
    @u.save

    @sdc = ShipDataCard.new
    @sdc.user_id = @u.id
    @sdc.design_name = "VRT Ship Design"
    @sdc.save
  end

  test "the user can set a feature for an SDC" do
    vf = VehicleFeature.new
    vf.ship_data_card_id = @sdc.id
    vf.set_feature_by_sym :warp_drive
    assert vf.save!, "Failed to save"

    vf = @u.ship_data_cards.first.vehicle_features.all
    assert_equal 1, vf.count, "Wrong list count"
  end
end
