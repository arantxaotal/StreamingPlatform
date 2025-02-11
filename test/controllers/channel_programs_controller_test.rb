require 'test_helper'

class ChannelProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get channel_programs_index_url
    assert_response :success
  end

  test "should get show" do
    get channel_programs_show_url
    assert_response :success
  end

  test "should get create" do
    get channel_programs_create_url
    assert_response :success
  end

  test "should get update" do
    get channel_programs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get channel_programs_destroy_url
    assert_response :success
  end

end
