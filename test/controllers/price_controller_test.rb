require 'test_helper'

class PriceControllerTest < ActionController::TestCase
  test "should get price page" do
    get :index
    assert_response :success
  end
end
