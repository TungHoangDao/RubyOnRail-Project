require 'test_helper'

class UsetSettingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get uset_setting_new_url
    assert_response :success
  end

end
