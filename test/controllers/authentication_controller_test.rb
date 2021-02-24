require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test 'user will register' do
    post users_url, params: { name: 'user', username: 'username', email: 'test@test.com', password: 'password', password_confirmation: 'password' }, as: :json
    assert_response :success
  end
  test 'get users' do
    get users_url, headers: auth_header
    assert_response :success
  end
end
