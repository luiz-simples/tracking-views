require 'test_helper'

class PriceControllerTest < ActionController::TestCase
  test "should get price page" do
    get :index
    assert_response :success
  end

  test "should view main header" do
    get :index
    assert_select "h1", "Price#Page"
  end
end
