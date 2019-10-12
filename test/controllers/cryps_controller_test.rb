require 'test_helper'

class CrypsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryp = cryps(:one)
  end

  test "should get index" do
    get cryps_url
    assert_response :success
  end

  test "should get new" do
    get new_cryp_url
    assert_response :success
  end

  test "should create cryp" do
    assert_difference('Cryp.count') do
      post cryps_url, params: { cryp: { amount_owned: @cryp.amount_owned, cost_per: @cryp.cost_per, symbol: @cryp.symbol, user_id: @cryp.user_id } }
    end

    assert_redirected_to cryp_url(Cryp.last)
  end

  test "should show cryp" do
    get cryp_url(@cryp)
    assert_response :success
  end

  test "should get edit" do
    get edit_cryp_url(@cryp)
    assert_response :success
  end

  test "should update cryp" do
    patch cryp_url(@cryp), params: { cryp: { amount_owned: @cryp.amount_owned, cost_per: @cryp.cost_per, symbol: @cryp.symbol, user_id: @cryp.user_id } }
    assert_redirected_to cryp_url(@cryp)
  end

  test "should destroy cryp" do
    assert_difference('Cryp.count', -1) do
      delete cryp_url(@cryp)
    end

    assert_redirected_to cryps_url
  end
end
