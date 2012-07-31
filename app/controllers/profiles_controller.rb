class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit,:update]

  def show
    @user = User.find params[:id]
  end

  def edit
    
    @profile = current_user.profile || Profile.new 

  end

  def update
    @profile = params[:profile]
    
  end
end
