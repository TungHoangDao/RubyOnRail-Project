require 'test_helper'

class NewsPostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get news_post_new_url
    assert_response :success
  end

end
