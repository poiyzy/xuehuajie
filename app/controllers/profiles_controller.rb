class ProfilesController < ApplicationController

  def show
    @user = User.find params[:id]
    @profile = @user.profile || Profile.new
  end

  def edit
    
    @profile = current_user.profile || Profile.new 

  end

  def update
    @profile = params[:profile]
    @profile.user = current_user
    @profile =
    
  end
end
