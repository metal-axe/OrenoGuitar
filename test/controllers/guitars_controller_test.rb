require 'test_helper'

class GuitarsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get guitars_create_url
    assert_response :success
  end

  test "should get destroy" do
    get guitars_destroy_url
    assert_response :success
  end

end
