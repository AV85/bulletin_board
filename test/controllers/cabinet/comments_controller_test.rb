require 'test_helper'

class Cabinet::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cabinet_comment = cabinet_comments(:one)
  end

  test "should get index" do
    get cabinet_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_cabinet_comment_url
    assert_response :success
  end

  test "should create cabinet_comment" do
    assert_difference('Cabinet::Comment.count') do
      post cabinet_comments_url, params: { cabinet_comment: {  } }
    end

    assert_redirected_to cabinet_comment_url(Cabinet::Comment.last)
  end

  test "should show cabinet_comment" do
    get cabinet_comment_url(@cabinet_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_cabinet_comment_url(@cabinet_comment)
    assert_response :success
  end

  test "should update cabinet_comment" do
    patch cabinet_comment_url(@cabinet_comment), params: { cabinet_comment: {  } }
    assert_redirected_to cabinet_comment_url(@cabinet_comment)
  end

  test "should destroy cabinet_comment" do
    assert_difference('Cabinet::Comment.count', -1) do
      delete cabinet_comment_url(@cabinet_comment)
    end

    assert_redirected_to cabinet_comments_url
  end
end
