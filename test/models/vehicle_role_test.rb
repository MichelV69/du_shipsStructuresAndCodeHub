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
end
