require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    post campaigns_url, params: { campaign: { duration: [:within_one_week, :witin_one_month, :within_three_months].sample, purpose: "Test", title: "Test" } }, headers: auth_header, as: :json
    @campaign = JSON.parse response.body
    post topics_url, params: { topic: { user_id: @campaign["user_id"], campaign_id: @campaign["id"], title: "title of topic" } }, headers: auth_header, as: :json
    @topic = JSON.parse response.body
  end

  test "should get index" do
    get topics_url, headers: auth_header, as: :json
    assert_response :success
  end

  test "should not create topic" do
    post topics_url, params: { topic: { user_id: @campaign["user_id"], campaign_id: @campaign["id"], title: "title of topic" } }, headers: auth_header, as: :json
    assert_response 201
  end

  test "should show topic" do
    get topic_url(@topic["id"]), headers: auth_header, as: :json
    assert_response :success
  end

  test "should update topic" do
    put topic_url(@topic["id"]), params: { topic: { campaign_id: @topic["campaign_id"], title: @topic["title"] } }, headers: auth_header, as: :json
    assert_response 200
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete topic_url(@topic["id"]), headers: auth_header, as: :json
    end

    assert_response 204
  end
end
