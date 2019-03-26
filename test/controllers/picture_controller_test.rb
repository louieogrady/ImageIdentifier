require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picture_index_url
    assert_response :success
  end

  test "should get show" do
    get picture_show_url
    assert_response :success
  end

  test "should get create" do
    get picture_create_url
    assert_response :success
  end

  test "should get edit" do
    get picture_edit_url
    assert_response :success
  end

  test "should get update" do
    get picture_update_url
    assert_response :success
  end

  test "should get delete" do
    get picture_delete_url
    assert_response :success
  end

end
