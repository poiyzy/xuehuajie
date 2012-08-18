#coding: utf-8
class FollowsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @user = User.find params[:follow_id]
    if  current_user.follow(@user.id)
       respond_to do |format|
        format.html {  
          redirect_to(:back,:notice => "已经成功关注")
        }
        format.js {
          render :json => "success"
        } 
        end
    else
        respond_to do |format|
        format.html {  
          redirect_to(:back,:notice =>  "关注失败")
        }
        format.js {
          render :json => "failed"
        } 
        end
    end
  end

  def destroy
    @user = User.find params[:follow_id]
    if  current_user.unfollow(@user.id)
       respond_to do |format|
        format.html {  
          redirect_to(:back,:notice => "已经取消关注")
        }
        format.js {
          render :json => "success"
        }
       end
    else
       respond_to do |format|
        format.html {  
          redirect_to(:back,:notice => "关注失败")
        }
        format.js {
          render :json => "failed"
        }
       end
    end 
  end

  def index
  end
end
