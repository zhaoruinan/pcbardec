require 'test_helper'

class DecrecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decrecord = decrecords(:one)
  end

  test "should get index" do
    get decrecords_url
    assert_response :success
  end

  test "should get new" do
    get new_decrecord_url
    assert_response :success
  end

  test "should create decrecord" do
    assert_difference('Decrecord.count') do
      post decrecords_url, params: { decrecord: { pc_num: @decrecord.pc_num, time: @decrecord.time } }
    end

    assert_redirected_to decrecord_url(Decrecord.last)
  end

  test "should show decrecord" do
    get decrecord_url(@decrecord)
    assert_response :success
  end

  test "should get edit" do
    get edit_decrecord_url(@decrecord)
    assert_response :success
  end

  test "should update decrecord" do
    patch decrecord_url(@decrecord), params: { decrecord: { pc_num: @decrecord.pc_num, time: @decrecord.time } }
    assert_redirected_to decrecord_url(@decrecord)
  end

  test "should destroy decrecord" do
    assert_difference('Decrecord.count', -1) do
      delete decrecord_url(@decrecord)
    end

    assert_redirected_to decrecords_url
  end
end
