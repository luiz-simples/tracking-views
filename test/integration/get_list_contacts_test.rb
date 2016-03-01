require 'test_helper'

class LeadFlowsTest < ActionDispatch::IntegrationTest
  test "get list contacts" do
    random_email = "random_email_#{Random.rand(101)}@email.com"
    post "/contact", name: 'Someone Name', email: random_email, message: 'Someone Text'
    assert_response :redirect

    get "/contacts"
    assert_select "h1", "Contacts#Page"
    assert_select "tr[id=\"#{random_email}\"]"
  end
end
