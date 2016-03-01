require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get about page" do
    get :index
    assert_response :success
  end

  test "should view main header" do
    get :index
    assert_select "h1", "About#Page"
  end
end
