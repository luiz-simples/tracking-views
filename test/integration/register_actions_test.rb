require 'test_helper'

class RegisterActionsTest < ActionDispatch::IntegrationTest
  def register_action(params)
    post "/actions", params, format: :json
  end

  test "register action: viewPage" do
    random_cid = "id_#{Random.rand(101)}"
    random_email = "random_email_#{Random.rand(101)}@email.com"

    register_action action: 'viewPage', cid: random_cid, reference: '/home'
    register_action action: 'viewPage', cid: random_cid, reference: '/about'
    register_action action: 'viewPage', cid: random_cid, reference: '/contact'

    post "/contact", name: 'Someone Name', email: random_email, message: 'Someone Text', cid: random_cid

    get "/actions/#{random_email}"
    assert_select "tr.activity", 3
  end
end
