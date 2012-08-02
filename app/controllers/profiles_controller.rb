#coding:utf-8
class ProfilesController < ApplicationController

  def show
    @user = User.find params[:id]
    @profile = @user.profile || Profile.new
  end

  def edit
    
    @profile = current_user.profile || Profile.new 

  end

  def update
    @profile = Profile.new  params[:profile]
    if current_user.profile.update_attributes params[:profile]
      flash[:notice] = "个人资料修改成功"
      redirect_to account_users_path
    else
      render :edit
    end
    
  end
end
