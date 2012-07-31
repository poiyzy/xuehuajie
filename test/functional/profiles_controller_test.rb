require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  def setup
    @user = users(:mato)
    sign_in @user
  end
  test "should get show" do
    get :show, :id => @user.id
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
