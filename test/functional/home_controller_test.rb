require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def setup
    @user = users(:mato)
    sign_in @user
  end
  test "should not get index" do
    sign_out @user 
    get :index
    assert_redirected_to root_path
  end
  
  test "user who first login should get account setting page" do
    get :index
    assert_response :success
     
  end

  test "user login should get right redirection" do
    get :index
    assert_redirected_to :success
  end


end
