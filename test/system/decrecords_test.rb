require "application_system_test_case"

class DecrecordsTest < ApplicationSystemTestCase
  setup do
    @decrecord = decrecords(:one)
  end

  test "visiting the index" do
    visit decrecords_url
    assert_selector "h1", text: "Decrecords"
  end

  test "creating a Decrecord" do
    visit decrecords_url
    click_on "New Decrecord"

    fill_in "Pc num", with: @decrecord.pc_num
    fill_in "Time", with: @decrecord.time
    click_on "Create Decrecord"

    assert_text "Decrecord was successfully created"
    click_on "Back"
  end

  test "updating a Decrecord" do
    visit decrecords_url
    click_on "Edit", match: :first

    fill_in "Pc num", with: @decrecord.pc_num
    fill_in "Time", with: @decrecord.time
    click_on "Update Decrecord"

    assert_text "Decrecord was successfully updated"
    click_on "Back"
  end

  test "destroying a Decrecord" do
    visit decrecords_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Decrecord was successfully destroyed"
  end
end
