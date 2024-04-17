require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  test "a profile responds to key fields" do
    p = Profile.new
    assert p.respond_to? :discord_id
    assert p.respond_to? :steam_id
    assert p.respond_to? :du_charname
  end

  test "a new user can have profile data" do
    u = User.new
    u.email = "an_email@example.com"
    u.password = "cleverPWD"
    u.build_profile

    u.profile.du_charname = "MyCoolToon"
    assert u.save!
    u.profile.discord_id = '444-444'
    assert u.save!
    u.profile.steam_id = "444-aaa-444"
    assert u.save!
  end

end
