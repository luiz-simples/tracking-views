require 'test_helper'

class LeadFlowsTest < ActionDispatch::IntegrationTest
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

  test "reject contact when without name" do
    send_contact_flow name: '', email: 'someone@email.com', message: 'Someone Text'
    assert_equal '/contact', path
    assert_select "h2.error", "Name can't be blank"
  end

  test "reject contact when without message" do
    send_contact_flow name: 'Someone Name', email: 'someone@email.com', message: ''
    assert_equal '/contact', path
    assert_select "h2.error", "Message can't be blank"
  end
end
