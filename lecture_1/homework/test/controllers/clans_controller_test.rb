require 'test_helper'

class ClansControllerTest < ActionDispatch::IntegrationTest
  test "should get samurais" do
    get clans_samurais_url
    assert_response :success
  end

end
