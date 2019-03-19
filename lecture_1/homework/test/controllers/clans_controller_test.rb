require 'test_helper'

class ClansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clan = clans(:one)
  end

  test "should get index" do
    get clans_url, as: :json
    assert_response :success
  end

  test "should create clan" do
    assert_difference('Clan.count') do
      post clans_url, params: { clan: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show clan" do
    get clan_url(@clan), as: :json
    assert_response :success
  end

  test "should update clan" do
    patch clan_url(@clan), params: { clan: {  } }, as: :json
    assert_response 200
  end

  test "should destroy clan" do
    assert_difference('Clan.count', -1) do
      delete clan_url(@clan), as: :json
    end

    assert_response 204
  end
end
