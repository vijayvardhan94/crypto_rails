require "application_system_test_case"

class CrypsTest < ApplicationSystemTestCase
  setup do
    @cryp = cryps(:one)
  end

  test "visiting the index" do
    visit cryps_url
    assert_selector "h1", text: "Cryps"
  end

  test "creating a Cryp" do
    visit cryps_url
    click_on "New Cryp"

    fill_in "Amount owned", with: @cryp.amount_owned
    fill_in "Cost per", with: @cryp.cost_per
    fill_in "Symbol", with: @cryp.symbol
    fill_in "User", with: @cryp.user_id
    click_on "Create Cryp"

    assert_text "Cryp was successfully created"
    click_on "Back"
  end

  test "updating a Cryp" do
    visit cryps_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @cryp.amount_owned
    fill_in "Cost per", with: @cryp.cost_per
    fill_in "Symbol", with: @cryp.symbol
    fill_in "User", with: @cryp.user_id
    click_on "Update Cryp"

    assert_text "Cryp was successfully updated"
    click_on "Back"
  end

  test "destroying a Cryp" do
    visit cryps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cryp was successfully destroyed"
  end
end
