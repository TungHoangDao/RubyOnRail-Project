require 'test_helper'

class UserSettingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_setting_new_url
    assert_response :success
  end

end
