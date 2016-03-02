require 'test_helper'

class RegisterActionsTest < ActionDispatch::IntegrationTest
  def register_action params
    post "/actions", params, format: :json
    JSON.parse(@response.body)['cid']
  end

  def register_flow
    random_email = "random_email_#{Random.rand(101)}@email.com"

    register_action       name: 'viewPage', reference: '/home'
    register_action       name: 'viewPage', reference: '/about'
    cid = register_action name: 'viewPage', reference: '/contact'

    post "/contact", name: 'Someone Name', email: random_email, message: 'Someone Text'

    cid
  end

  test "register action: viewPage" do
    cid = register_flow
    get "/actions/#{cid}"
    assert_select "tr.activity", 3
  end

  test "list actions by cid" do
    register_flow
    cid = register_flow
    get "/actions/#{cid}"
    assert_select "tr.activity", 6
  end
end
