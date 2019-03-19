require 'test_helper'

class SamuraisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @samurai = samurais(:one)
  end

  test "should get index" do
    get samurais_url, as: :json
    assert_response :success
  end

  test "should create samurai" do
    assert_difference('Samurai.count') do
      post samurais_url, params: { samurai: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show samurai" do
    get samurai_url(@samurai), as: :json
    assert_response :success
  end

  test "should update samurai" do
    patch samurai_url(@samurai), params: { samurai: {  } }, as: :json
    assert_response 200
  end

  test "should destroy samurai" do
    assert_difference('Samurai.count', -1) do
      delete samurai_url(@samurai), as: :json
    end

    assert_response 204
  end
end
