require 'test_helper'

class StringsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get strings_edit_url
    assert_response :success
  end

  test "should get update" do
    get strings_update_url
    assert_response :success
  end

end
