require 'test_helper'

class InternshipRecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internship_recruitments_index_url
    assert_response :success
  end

  test "should get new" do
    get internship_recruitments_new_url
    assert_response :success
  end

  test "should get show" do
    get internship_recruitments_show_url
    assert_response :success
  end

end
