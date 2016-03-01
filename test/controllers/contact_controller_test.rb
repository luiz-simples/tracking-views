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

  test "should have form with field name" do
    get :index
    assert_select "form>input[name=\"name\"]", 1
  end
end
