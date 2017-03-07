require 'test_helper'

class CurriculumVitaesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get curriculum_vitaes_new_url
    assert_response :success
  end

  test "should get show" do
    get curriculum_vitaes_show_url
    assert_response :success
  end

  test "should get edit" do
    get curriculum_vitaes_edit_url
    assert_response :success
  end

end
