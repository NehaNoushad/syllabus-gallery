require "test_helper"

class CurriculumControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get curriculum_show_url
    assert_response :success
  end
end
