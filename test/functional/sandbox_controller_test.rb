require 'test_helper'

class SandboxControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update_pict" do
    get :update_pict
    assert_response :success
  end

end
