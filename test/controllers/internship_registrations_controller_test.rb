require 'test_helper'

class InternshipRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internship_registrations_index_url
    assert_response :success
  end

  test "should get new" do
    get internship_registrations_new_url
    assert_response :success
  end

  test "should get edit" do
    get internship_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get internship_registrations_update_url
    assert_response :success
  end

end
