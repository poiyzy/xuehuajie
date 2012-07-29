require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def setup
    @user = users(:mato)
    sign_in @user
  end
  test "should not get index" do
    get root_path
    assert_response :success
  end
  
  test "user who first login should get account setting page" do
     
  end

  test "user login should get right redirection" do
    get :index
    assert_redirected_to home_path
  end

  test "people not sign up should redirect to signup" do
    
  end

end
