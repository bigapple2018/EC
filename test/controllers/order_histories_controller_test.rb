require 'test_helper'

class OrderHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_histories_index_url
    assert_response :success
  end

end
