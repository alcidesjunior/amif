require 'test_helper'

class AtletasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atletas_index_url
    assert_response :success
  end

  test "should get show" do
    get atletas_show_url
    assert_response :success
  end

  test "should get edit" do
    get atletas_edit_url
    assert_response :success
  end

  test "should get create" do
    get atletas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get atletas_destroy_url
    assert_response :success
  end

  test "should get search" do
    get atletas_search_url
    assert_response :success
  end

end
