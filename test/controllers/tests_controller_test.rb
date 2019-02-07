require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get test_one" do
    get tests_test_one_url
    assert_response :success
  end

end
