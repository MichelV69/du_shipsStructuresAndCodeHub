require "test_helper"

class ShipDataCardTest < ActiveSupport::TestCase
  setup do
    @u = User.new
    @u.email = "an_email@example.com"
    @u.password = "cleverPWD"
    @u.save
  end

  test "sdc model responds to required attributes" do
    sdc = ShipDataCard.new

    assert sdc.respond_to? :user_id
    assert sdc.respond_to? :design_name
    assert sdc.respond_to? :core_size
    assert sdc.respond_to? :env_atmosphere
    assert sdc.respond_to? :env_ground
    assert sdc.respond_to? :env_space
    assert sdc.respond_to? :price_blueprint
    assert sdc.respond_to? :price_token
  end

  test "user can create a ship data card" do
    sdc = ShipDataCard.new
    sdc.user_id = @u.id
    sdc.design_name = "first ship"
    assert sdc.save!

  end

  test "user can create three ship data cards" do

    sdc1 = ShipDataCard.new
    sdc1.user_id = @u.id
    sdc1.design_name = "first ship #2"
    assert sdc1.save!

    sdc2 = ShipDataCard.new
    sdc2.user_id = @u.id
    sdc2.design_name = "second ship"
    assert sdc2.save!

    sdc3 = ShipDataCard.new
    sdc3.user_id = @u.id
    sdc3.design_name = "third ship"
    assert sdc3.save!

    scdc_list = @u.ship_data_cards.all
    assert_equal 3, scdc_list.count
  end

  test  "model converts core_size to text" do
    sdc = ShipDataCard.new
    sdc.user_id = @u.id
    sdc.design_name = "first ship"

    sdc.core_size = 1
    assert_equal "XS",  sdc.core_size_text
    sdc.core_size = 2
    assert_equal "S",  sdc.core_size_text
    sdc.core_size = 3
    assert_equal "M",  sdc.core_size_text
    sdc.core_size = 4
    assert_equal "L",  sdc.core_size_text
  end

  test "model correctly answers is_hybrid?" do
    sdc = ShipDataCard.new
    sdc.user_id = @u.id
    sdc.design_name = "first ship"

    assert_not_equal true, sdc.is_hybrid?

    sdc.env_space = true
    assert_not_equal true, sdc.is_hybrid?

    sdc.env_atmosphere = true
    assert_equal true, sdc.is_hybrid?

    sdc.env_space = false
    assert_not_equal true, sdc.is_hybrid?
  end

end
