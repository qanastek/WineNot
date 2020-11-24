require 'test_helper'

class WineMakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine_maker = wine_makers(:one)
  end

  test "should get index" do
    get wine_makers_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_maker_url
    assert_response :success
  end

  test "should create wine_maker" do
    assert_difference('WineMaker.count') do
      post wine_makers_url, params: { wine_maker: { name: @wine_maker.name } }
    end

    assert_redirected_to wine_maker_url(WineMaker.last)
  end

  test "should show wine_maker" do
    get wine_maker_url(@wine_maker)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_maker_url(@wine_maker)
    assert_response :success
  end

  test "should update wine_maker" do
    patch wine_maker_url(@wine_maker), params: { wine_maker: { name: @wine_maker.name } }
    assert_redirected_to wine_maker_url(@wine_maker)
  end

  test "should destroy wine_maker" do
    assert_difference('WineMaker.count', -1) do
      delete wine_maker_url(@wine_maker)
    end

    assert_redirected_to wine_makers_url
  end
end
