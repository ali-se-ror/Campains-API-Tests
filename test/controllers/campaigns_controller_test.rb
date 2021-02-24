require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    post campaigns_url, params: { campaign: { duration: [:within_one_week, :witin_one_month, :within_three_months].sample, purpose: "Test", title: "Test" } }, headers: auth_header, as: :json
    @campaign = JSON.parse response.body
  end

  test "should get index" do
    get campaigns_url, headers: auth_header, as: :json
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { duration: [:within_one_week, :witin_one_month, :within_three_months].sample, purpose: "Test", title: "Test" } }, headers: auth_header, as: :json
    end

    assert_response 201
  end

  test "should show campaign" do
    get campaign_url(@campaign["id"]), headers: auth_header, as: :json
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign["id"]), params: { campaign: { duration: @campaign["duration"], purpose: @campaign["purpose"], title: @campaign["title"] } }, headers: auth_header, as: :json
    assert_response 200
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign["id"]), headers: auth_header, as: :json
    end

    assert_response 204
  end
end
