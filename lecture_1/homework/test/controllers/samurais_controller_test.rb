require 'test_helper'

class SamuraisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get samurais_index_url
    assert_response :success
  end

  test "should get create" do
    get samurais_create_url
    assert_response :success
  end

  test "should get show" do
    get samurais_show_url
    assert_response :success
  end

  test "should get destroy" do
    get samurais_destroy_url
    assert_response :success
  end

end
