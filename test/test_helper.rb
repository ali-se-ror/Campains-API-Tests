ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login
    record = post login_url, params: { email: 'user@one.com', password: 'password' }, as: :json
    assert_response :success
    JSON.parse(response.body)["token"]
  end
  def auth_header
    token = login
    {'Authorization': "bearer "+token}
  end
end
