require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get contact page" do
    get :index
    assert_response :success
  end

  test "should view main header" do
    get :index
    assert_select "h1", "Contact#Page"
    assert_select "form[action=\"/contact\"]", 1
  end

  test "should have form with field name" do
    get :index
    assert_select "form>input[name=\"name\"]", 1
  end

  test "should have form with field email" do
    get :index
    assert_select "form>input[name=\"email\"]", 1
  end

  test "should have form with field message" do
    get :index
    assert_select "form>textarea[name=\"message\"]", 1
  end

  test "should have form with send button" do
    get :index
    assert_select "form>input[type=\"submit\"]", 1
  end
end
