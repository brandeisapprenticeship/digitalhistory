require 'test_helper'

class PathCommentsControllerTest < ActionController::TestCase
  setup do
    @path_comment = path_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:path_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create path_comment" do
    assert_difference('PathComment.count') do
      post :create, path_comment: { present: @path_comment.present, submission_id: @path_comment.submission_id, text: @path_comment.text, user_id: @path_comment.user_id }
    end

    assert_redirected_to path_comment_path(assigns(:path_comment))
  end

  test "should show path_comment" do
    get :show, id: @path_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @path_comment
    assert_response :success
  end

  test "should update path_comment" do
    patch :update, id: @path_comment, path_comment: { present: @path_comment.present, submission_id: @path_comment.submission_id, text: @path_comment.text, user_id: @path_comment.user_id }
    assert_redirected_to path_comment_path(assigns(:path_comment))
  end

  test "should destroy path_comment" do
    assert_difference('PathComment.count', -1) do
      delete :destroy, id: @path_comment
    end

    assert_redirected_to path_comments_path
  end
end
