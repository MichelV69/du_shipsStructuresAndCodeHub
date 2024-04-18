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

 test "the user can set multiple features for an SDC" do
    vf = VehicleFeature.new
    vf.ship_data_card_id = @sdc.id
    vf.set_feature_by_sym :detailed_interior
    assert vf.save!, "Failed to save"

    vf2 = VehicleFeature.new
    vf2.ship_data_card_id = @sdc.id
    vf2.set_feature_by_sym :radar_atmo
    assert vf2.save!, "Failed to save"

    vf3 = VehicleFeature.new
    vf3.ship_data_card_id = @sdc.id
    vf3.set_feature_by_sym :radar_space
    assert vf3.save!, "Failed to save"

    vf_list = @u.ship_data_cards.first.vehicle_features.all
    assert_equal 3, vf_list.count, "Wrong list count"
  end

  test "the model recognizes a list of different features" do
    feature_test_list = {detailed_interior: 1, radar_atmo: 2, radar_space: 3, dsat: 4, warp_drive: 5,
    rocket_engines: 6, shields: 7, weapons:8, antigrav: 9, tile_scanner: 2}

    vf = VehicleFeature.new
    vf.ship_data_card_id = @sdc.id

    feature_test_list.each do |key, value|
      puts key.to_s
      vf.set_feature_by_sym(key)
      assert_equal value, vf.feature_id
    end
  end
end
