require "application_system_test_case"

class WineColorsTest < ApplicationSystemTestCase
  setup do
    @wine_color = wine_colors(:one)
  end

  test "visiting the index" do
    visit wine_colors_url
    assert_selector "h1", text: "Wine Colors"
  end

  test "creating a Wine color" do
    visit wine_colors_url
    click_on "New Wine Color"

    fill_in "Name", with: @wine_color.name
    click_on "Create Wine color"

    assert_text "Wine color was successfully created"
    click_on "Back"
  end

  test "updating a Wine color" do
    visit wine_colors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @wine_color.name
    click_on "Update Wine color"

    assert_text "Wine color was successfully updated"
    click_on "Back"
  end

  test "destroying a Wine color" do
    visit wine_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wine color was successfully destroyed"
  end
end
