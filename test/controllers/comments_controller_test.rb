require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    post campaigns_url, params: { campaign: { duration: [:within_one_week, :witin_one_month, :within_three_months].sample, purpose: "Test", title: "Test" } }, headers: auth_header, as: :json
    @campaign = JSON.parse response.body
    post comments_url, params: { comment: { user_id: @campaign["user_id"], commentable_id: @campaign["id"], commentable_type: "Campaign", content: "Topic with hello" } },headers: auth_header, as: :json
    @comment = JSON.parse response.body
  end

  test "should get index" do
    get comments_url,headers: auth_header, as: :json
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { user_id: @campaign["user_id"], commentable_id: @campaign["id"], commentable_type: "Campaign", content: "Topic with hello" } },headers: auth_header, as: :json
    end

    assert_response 201
  end

  test "should show comment" do
    get comment_url(@comment["id"]),headers: auth_header, as: :json
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment["id"]), params: { comment: { commentable_id: @campaign["id"], commentable_type: "Campaign", content: @comment["content"] } },headers: auth_header, as: :json
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment["id"]),headers: auth_header, as: :json
    end

    assert_response 204
  end
end
