require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Peacock App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Peacock App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Peacock App"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Peacock App"
  end
end