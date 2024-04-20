require "application_system_test_case"

class LandingPagesTest < ApplicationSystemTestCase
  test "visiting the index should see app and landing page titles" do
    visit "/"

    assert_selector "h1", text: "Builder's Bay"
    assert_selector "h2", text: "LandingPage"
  end

  test "visiting the index while not logged in, I should see a login link" do
    visit "sign_out"
    sleep 0.5
    visit "/"

    assert_selector "div.user_card h3", text: "Not signed in"
    assert_selector "div.login_prompt", text: "Sign in, please"
  end
end
