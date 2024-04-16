require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  test "a profile responds to key fields" do
    profile = Profile.new
    assert profile.respond_to? :discord_id
    assert profile.respond_to? :steam_id
    assert profile.respond_to? :du_charname
  end

end
