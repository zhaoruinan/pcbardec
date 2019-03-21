require 'test_helper'

class DecpcbarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decpcbar = decpcbars(:one)
  end

  test "should get index" do
    get decpcbars_url
    assert_response :success
  end

  test "should get new" do
    get new_decpcbar_url
    assert_response :success
  end

  test "should create decpcbar" do
    assert_difference('Decpcbar.count') do
      post decpcbars_url, params: { decpcbar: { ip_num: @decpcbar.ip_num, ip_sart: @decpcbar.ip_sart, name: @decpcbar.name } }
    end

    assert_redirected_to decpcbar_url(Decpcbar.last)
  end

  test "should show decpcbar" do
    get decpcbar_url(@decpcbar)
    assert_response :success
  end

  test "should get edit" do
    get edit_decpcbar_url(@decpcbar)
    assert_response :success
  end

  test "should update decpcbar" do
    patch decpcbar_url(@decpcbar), params: { decpcbar: { ip_num: @decpcbar.ip_num, ip_sart: @decpcbar.ip_sart, name: @decpcbar.name } }
    assert_redirected_to decpcbar_url(@decpcbar)
  end

  test "should destroy decpcbar" do
    assert_difference('Decpcbar.count', -1) do
      delete decpcbar_url(@decpcbar)
    end

    assert_redirected_to decpcbars_url
  end
end
