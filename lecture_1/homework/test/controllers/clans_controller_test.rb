require 'test_helper'

class ClansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clans_index_url
    assert_response :success
  end

  test "should get create" do
    get clans_create_url
    assert_response :success
  end

end
