#coding:utf-8
class ProfilesController < ApplicationController

  def show
    @user = User.find params[:id]
    @profile = @user.profile || Profile.new
  end

  def edit
    
    @profile = current_user.profile || Profile.new 

  end
  
  def create
    @profile = Profile.new params[:profile]
    @profile.valid?
    if current_user.profile
       if  current_user.profile.update_attributes params[:profile]
         flash[:notice] = "个人资料修改成功"
         redirect_to home_path
         current_user.update_attribute(:getting_started,true)
       else
         flash[:alert] = "资料出错，请重新检查"
         render :start
       end
    else
      if current_user.profile.create params[:profile]
         flash[:notice] = "个人资料修改成功"
         redirect_to home_path
         current_user.update_attribute(:getting_started,true)
      else
         flash[:alert] = "资料出错，请重新检查"
         render :start
      end
    end
  end

  def start
      @profile = Profile.find_or_initialize_by_user_id(current_user.id)
      render :layout => 'devise'
  end
  

  def update
    @profile = Profile.new  params[:profile]
    @profile.valid?
    if current_user.profile.update_attributes params[:profile]
      flash[:notice] = "个人资料修改成功"
      redirect_to account_users_path
    else
      render :edit
    end
    
  end
end
