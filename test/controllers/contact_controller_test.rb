require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get contact page" do
    get :index
    assert_response :success
  end

  test "should view main header" do
    get :index
    assert_select "h1", "Contact#Page"
  end
end
