require "test_helper"

class VehicleAttributesCardTest < ActiveSupport::TestCase
  setup do
    @u = User.new
    @u.email = "vrt_email@example.com"
    @u.password = "cleverPWD"
    @u.save

    @vdc = VehicleDataCard.new
    @vdc.user_id = @u.id
    @vdc.design_name = "VACT Ship Design"
    @vdc.save
  end

  test "the model recognizes a list of different VehicleAttributes" do
    attribute_test_list = { common_dry_weight: 1, common_cargo_space: 2,
      atmosphere_cargo_lift_1g: 3, atmosphere_max_speed_kmh: 4, atmosphere_hover_power_mn: 5,
      atmosphere_sustentation_speed_kmh: 6, atmosphere_thrust_mn: 7, atmosphere_brake_mn: 8,
      atmosphere_wing_lift_mn: 9, atmosphere_fuel_kl: 10,
      space_thrust_mn: 11, space_brake_mn: 12, space_hover_mn: 13, space_fuel_kl: 14}

    vac = VehicleAttributesCard.new
    vac.vehicle_data_card_id = @vdc.id

    attribute_test_list.each do |key, value|
      #puts key.to_s
      vac.set_attr_by_sym(key)
      assert_equal value, vac.attribute_id
    end
  end

end
