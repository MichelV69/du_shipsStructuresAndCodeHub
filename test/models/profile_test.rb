require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  test "a profile responds to userID" do
    profile = Profile.new
    assert profile.responds user_id
  end
end
