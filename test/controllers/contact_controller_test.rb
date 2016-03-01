require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get contact page" do
    get :index
    assert_response :success
  end
end
