#coding:utf-8
class ProfilesController < ApplicationController

  def show
    @user = User.find params[:id]
    @profile = @user.profile || Profile.new
  end

  def edit
    
    @profile = current_user.profile || Profile.new 

  end
  
  def upload_avatar

    params[:avatar].content_type = MIME::Types.type_for(params[:avatar].original_filename).to_s
    @profile = Profile.find_or_initialize_by_user_id(current_user.id)
    @profile.avatar =  params[:avatar].tempfile 
    if @profile.save
      render :json => { 'status' => 1  }.to_json
    else
        render :json => { 'status' => 0 }.to_json
    end

  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
         current_user.update_attribute(:getting_started,true)
         redirect_to home_path ,:notice =>  "个人资料修改成功"
    else
         flash[:alert] = "资料出错，请重新检查"
         render :start
    end
  end

  def start
      @profile = Profile.find_or_initialize_by_user_id(current_user.id)
      render :layout => 'devise'
  end
  

  def update
    @profile = current_user.build_profile params[:profile]
    if @profile.save
      redirect_to account_users_path, :notice => "个人资料修改成功"
    else
      render :edit
    end
  end
end
