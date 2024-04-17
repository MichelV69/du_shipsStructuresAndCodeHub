require "test_helper"

class VehicleRoleTest < ActiveSupport::TestCase
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

  test "the user can set a role for an SDC" do
    vr = VehicleRole.new
    vr.ship_data_card_id = @sdc.id
    vr.set_role_by_sym :combat
    assert vr.save!, "Failed to save"

    vr_list = @u.ship_data_cards.first.vehicle_roles.all
    assert_equal 1, vr_list.count, "Wrong list count"
  end

  test "the user can set multiple roles for an SDC" do
    vr = VehicleRole.new
    vr.ship_data_card_id = @sdc.id
    vr.set_role_by_sym :pvp_combat
    assert vr.save!, "Failed to save"

    vr2 = VehicleRole.new
    vr2.ship_data_card_id = @sdc.id
    vr2.set_role_by_sym :prospector
    assert vr2.save!, "Failed to save"

    vr3 = VehicleRole.new
    vr3.ship_data_card_id = @sdc.id
    vr3.set_role_by_sym :hauler
    assert vr3.save!, "Failed to save"

    vr_list = @u.ship_data_cards.first.vehicle_roles.all
    assert_equal 3, vr_list.count, "Wrong list count"
  end

end
