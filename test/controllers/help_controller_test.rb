require 'test_helper'

class HelpControllerTest < ActionController::TestCase
  test "should get privacy" do
    get :privacy
    assert_response :success
  end

end
