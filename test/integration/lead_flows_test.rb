require 'test_helper'

class LoadFlowsTest < ActionDispatch::IntegrationTest
  test "visitant should send contact" do
    get "/contact"
    assert_response :success

    post_via_redirect "/contact", name: 'Someone Name', email: 'someone@email.com', message: 'Someone Text'
    assert_equal '/success', path
  end
end
