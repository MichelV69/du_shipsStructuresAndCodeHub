require "test_helper"

class VehicleDataCardTest < ActiveSupport::TestCase
  setup do
    @u = User.new
    @u.email = "an_email@example.com"
    @u.password = "cleverPWD"
    @u.save
  end

  test "vdc model responds to required attributes" do
    vdc = VehicleDataCard.new

    assert vdc.respond_to? :user_id
    assert vdc.respond_to? :design_name
    assert vdc.respond_to? :core_size
    assert vdc.respond_to? :env_atmosphere
    assert vdc.respond_to? :env_ground
    assert vdc.respond_to? :env_space
    assert vdc.respond_to? :price_blueprint
    assert vdc.respond_to? :price_token
  end

  test "user can create a ship data card" do
    vdc = VehicleDataCard.new
    vdc.user_id = @u.id
    vdc.design_name = "first ship"
    assert vdc.save!

  end

  test "user can create three ship data cards" do

    vdc1 = VehicleDataCard.new
    vdc1.user_id = @u.id
    vdc1.design_name = "first ship #2"
    assert vdc1.save!

    vdc2 = VehicleDataCard.new
    vdc2.user_id = @u.id
    vdc2.design_name = "second ship"
    assert vdc2.save!

    vdc3 = VehicleDataCard.new
    vdc3.user_id = @u.id
    vdc3.design_name = "third ship"
    assert vdc3.save!

    scdc_list = @u.vehicle_data_cards.all
    assert_equal 3, scdc_list.count
  end

  test  "model converts core_size to text" do
    vdc = VehicleDataCard.new
    vdc.user_id = @u.id
    vdc.design_name = "first ship"

    vdc.core_size = 1
    assert_equal "XS",  vdc.core_size_text
    vdc.core_size = 2
    assert_equal "S",  vdc.core_size_text
    vdc.core_size = 3
    assert_equal "M",  vdc.core_size_text
    vdc.core_size = 4
    assert_equal "L",  vdc.core_size_text
  end

  test "model correctly answers is_hybrid?" do
    vdc = VehicleDataCard.new
    vdc.user_id = @u.id
    vdc.design_name = "first ship"

    assert_not_equal true, vdc.is_hybrid?

    vdc.env_space = true
    assert_not_equal true, vdc.is_hybrid?

    vdc.env_atmosphere = true
    assert_equal true, vdc.is_hybrid?

    vdc.env_space = false
    assert_not_equal true, vdc.is_hybrid?
  end

end
