require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home page" do
    get :index
    assert_response :success
  end

  test "should view main header" do
    get :index
    assert_select "h1", "Home#Page"
  end
end
