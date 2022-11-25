require 'test_helper'

class CreatorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get creators_index_url
    assert_response :success
  end
end
