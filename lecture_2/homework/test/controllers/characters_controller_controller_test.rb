require 'test_helper'

class CharactersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get characters_controller_index_url
    assert_response :success
  end

end
