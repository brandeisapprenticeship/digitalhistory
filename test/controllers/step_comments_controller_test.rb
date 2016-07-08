require 'test_helper'

class StepCommentsControllerTest < ActionController::TestCase
  setup do
    @step_comment = step_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_comment" do
    assert_difference('StepComment.count') do
      post :create, step_comment: { step_id: @step_comment.step_id, text: @step_comment.text, user_id: @step_comment.user_id }
    end

    assert_redirected_to step_comment_path(assigns(:step_comment))
  end

  test "should show step_comment" do
    get :show, id: @step_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step_comment
    assert_response :success
  end

  test "should update step_comment" do
    patch :update, id: @step_comment, step_comment: { step_id: @step_comment.step_id, text: @step_comment.text, user_id: @step_comment.user_id }
    assert_redirected_to step_comment_path(assigns(:step_comment))
  end

  test "should destroy step_comment" do
    assert_difference('StepComment.count', -1) do
      delete :destroy, id: @step_comment
    end

    assert_redirected_to step_comments_path
  end
end
