# frozen_string_literal: true

require 'test_helper'

class SamuraiWarriorControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get samurai_warrior_index_url
    assert_response :success
  end
end
