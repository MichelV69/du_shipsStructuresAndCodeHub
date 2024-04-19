require "application_system_test_case"

class LandingPagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Builder's Bay"
    assert_selector "h2", text: "LandingPage"
  end
end
