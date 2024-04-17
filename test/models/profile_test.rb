require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  test "a profile responds to key fields" do
    p = Profile.new
    assert p.respond_to? :discord_id
    assert p.respond_to? :steam_id
    assert p.respond_to? :du_charname
  end
end
