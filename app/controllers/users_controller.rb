class UsersController < ApplicationController
  before_filter :getting_start!, :except => :start

  def show
    @user = User.find(params[:id])
    @profile = @uesr.profile
  end

  def account

  end
 
  def start
    @profile = Profile.new
    render :layout => 'devise'
  end

end
