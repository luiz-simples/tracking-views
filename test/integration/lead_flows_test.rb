require 'test_helper'

class LoadFlowsTest < ActionDispatch::IntegrationTest
  def send_contact_flow(contact)
    get "/contact"
    assert_response :success

    post_via_redirect "/contact", contact
  end

  test "visitant should send contact" do
    send_contact_flow name: 'Someone Name', email: 'someone@email.com', message: 'Someone Text'
    assert_equal '/success', path
  end

  test "reject contact when without email" do
    send_contact_flow name: 'Someone Name', email: '', message: 'Someone Text'
    assert_equal '/contact', path
    assert_select "h2.error", "Email can't be blank, Email is not an email"
  end
end
