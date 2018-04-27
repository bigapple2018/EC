require 'test_helper'

class CdItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cd_items_new_url
    assert_response :success
  end

  test "should get show" do
    get cd_items_show_url
    assert_response :success
  end

  test "should get create" do
    get cd_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cd_items_destroy_url
    assert_response :success
  end

end
