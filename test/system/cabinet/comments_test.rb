require "application_system_test_case"

class Cabinet::CommentsTest < ApplicationSystemTestCase
  setup do
    @cabinet_comment = cabinet_comments(:one)
  end

  test "visiting the index" do
    visit cabinet_comments_url
    assert_selector "h1", text: "Cabinet/Comments"
  end

  test "creating a Comment" do
    visit cabinet_comments_url
    click_on "New Cabinet/Comment"

    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "updating a Comment" do
    visit cabinet_comments_url
    click_on "Edit", match: :first

    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment" do
    visit cabinet_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
