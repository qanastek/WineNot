require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Createdat", with: @review.createdAt
    fill_in "Description", with: @review.description
    fill_in "Lastedit", with: @review.lastEdit
    fill_in "Name", with: @review.name
    fill_in "Stars", with: @review.stars
    fill_in "User", with: @review.user_id
    fill_in "Wine", with: @review.wine_id
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit reviews_url
    click_on "Edit", match: :first

    fill_in "Createdat", with: @review.createdAt
    fill_in "Description", with: @review.description
    fill_in "Lastedit", with: @review.lastEdit
    fill_in "Name", with: @review.name
    fill_in "Stars", with: @review.stars
    fill_in "User", with: @review.user_id
    fill_in "Wine", with: @review.wine_id
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
