require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def setup
    @user = users(:mato)
    sign_in @user
  end
  
  
  test "user who first login should get account setting page" do
    get :index
    assert_redirected_to getting_start_path
  end

  test "user login should get home" do
    @user.getting_started = true
    @user.save
    get :index
    assert_redirected_to :success
  end


end
