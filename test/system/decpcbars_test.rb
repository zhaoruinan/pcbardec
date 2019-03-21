require "application_system_test_case"

class DecpcbarsTest < ApplicationSystemTestCase
  setup do
    @decpcbar = decpcbars(:one)
  end

  test "visiting the index" do
    visit decpcbars_url
    assert_selector "h1", text: "Decpcbars"
  end

  test "creating a Decpcbar" do
    visit decpcbars_url
    click_on "New Decpcbar"

    fill_in "Ip num", with: @decpcbar.ip_num
    fill_in "Ip sart", with: @decpcbar.ip_sart
    fill_in "Name", with: @decpcbar.name
    click_on "Create Decpcbar"

    assert_text "Decpcbar was successfully created"
    click_on "Back"
  end

  test "updating a Decpcbar" do
    visit decpcbars_url
    click_on "Edit", match: :first

    fill_in "Ip num", with: @decpcbar.ip_num
    fill_in "Ip sart", with: @decpcbar.ip_sart
    fill_in "Name", with: @decpcbar.name
    click_on "Update Decpcbar"

    assert_text "Decpcbar was successfully updated"
    click_on "Back"
  end

  test "destroying a Decpcbar" do
    visit decpcbars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Decpcbar was successfully destroyed"
  end
end
