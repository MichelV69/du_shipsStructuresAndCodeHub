require "test_helper"

class ShipDataCardTest < ActiveSupport::TestCase

  ## t.integer :user_id
  ## t.string  :design_name
  ## t.integer :price_blueprint
  ## t.integer :price_token
  ## t.integer :core_size
  ## t.boolean :env_atmosphere
  ## t.boolean :env_ground
  ## t.boolean :space

  test "sdc model responds to required attributes" do
    sdc = ShipDataCard.new

    assert sdc.respond_to? :user_id
    assert sdc.respond_to? :design_name
    assert sdc.respond_to? :price_blueprint
    assert sdc.respond_to? :price_token
    assert sdc.respond_to? :core_size
    assert sdc.respond_to? :env_atmosphere
    assert sdc.respond_to? :env_ground
    assert sdc.respond_to? :space
  end

  test "user can create a ship data card" do
    u = User.new
    u.email = "an_email@example.com"
    u.password = "cleverPWD"
    u.save

    sdc = ShipDataCard.new
    sdc.user_id = u.id
    sdc.design_name = "first ship"
    assert sdc.save

  end

  test "user can create three ship data cards" do
    u = User.new
    u.email = "an_email@example.com"
    u.password = "cleverPWD"
    u.save

    sdc1 = ShipDataCard.new
    sdc1.user_id = u.id
    sdc1.design_name = "first ship #2"
    assert sdc1.save

    sdc2 = ShipDataCard.new
    sdc2.user_id = u.id
    sdc2.design_name = "second ship"
    assert sdc2.save

    sdc3 = ShipDataCard.new
    sdc3.user_id = u.id
    sdc3.design_name = "third ship"
    assert sdc3.save

    scdc_list = u.ship_data_cards.all
    assert scdc_list.count == 3
  end

end
