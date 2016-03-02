require 'test_helper'

class RegisterActionsTest < ActionDispatch::IntegrationTest
  def register_action(params)
    post "/actions", params, format: :json
  end

  def register_flow
    random_cid = "id_#{Random.rand(101)}"
    random_email = "random_email_#{Random.rand(101)}@email.com"

    register_action action: 'viewPage', cid: random_cid, reference: '/home'
    register_action action: 'viewPage', cid: random_cid, reference: '/about'
    register_action action: 'viewPage', cid: random_cid, reference: '/contact'
    post "/contact", name: 'Someone Name', email: random_email, message: 'Someone Text', cid: random_cid

    random_cid
  end

  test "register action: viewPage" do
    cid = register_flow
    get "/actions/#{cid}"
    assert_select "tr.activity", 3
  end

  test "list actions by email" do
    register_flow
    cid = register_flow

    get "/actions/#{cid}"
    assert_select "tr.activity", 3
  end
end
