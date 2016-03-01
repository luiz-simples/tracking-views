require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get about page" do
    get :index
    assert_response :success
  end
end
