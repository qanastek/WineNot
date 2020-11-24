require 'test_helper'

class WineColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine_color = wine_colors(:one)
  end

  test "should get index" do
    get wine_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_color_url
    assert_response :success
  end

  test "should create wine_color" do
    assert_difference('WineColor.count') do
      post wine_colors_url, params: { wine_color: { name: @wine_color.name } }
    end

    assert_redirected_to wine_color_url(WineColor.last)
  end

  test "should show wine_color" do
    get wine_color_url(@wine_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_color_url(@wine_color)
    assert_response :success
  end

  test "should update wine_color" do
    patch wine_color_url(@wine_color), params: { wine_color: { name: @wine_color.name } }
    assert_redirected_to wine_color_url(@wine_color)
  end

  test "should destroy wine_color" do
    assert_difference('WineColor.count', -1) do
      delete wine_color_url(@wine_color)
    end

    assert_redirected_to wine_colors_url
  end
end
