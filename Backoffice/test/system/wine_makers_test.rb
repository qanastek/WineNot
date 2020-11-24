require "application_system_test_case"

class WineMakersTest < ApplicationSystemTestCase
  setup do
    @wine_maker = wine_makers(:one)
  end

  test "visiting the index" do
    visit wine_makers_url
    assert_selector "h1", text: "Wine Makers"
  end

  test "creating a Wine maker" do
    visit wine_makers_url
    click_on "New Wine Maker"

    fill_in "Name", with: @wine_maker.name
    click_on "Create Wine maker"

    assert_text "Wine maker was successfully created"
    click_on "Back"
  end

  test "updating a Wine maker" do
    visit wine_makers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @wine_maker.name
    click_on "Update Wine maker"

    assert_text "Wine maker was successfully updated"
    click_on "Back"
  end

  test "destroying a Wine maker" do
    visit wine_makers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wine maker was successfully destroyed"
  end
end
