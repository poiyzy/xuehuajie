#coding: utf-8
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def douban
    if current_user
      
      if current_user.bind_service(env["omniauth.auth"],current_user) == "Exist"
        redirect_to account_users_path, :notice => "成功重新绑定Douban账号"
      else 
       redirect_to getting_start_path,  :notice => "成功绑定 Douban 账号"
      end
    else
      @user = User.find_for_douban(env["omniauth.auth"])

        if @user && @user.persisted?
          flash[:notice] = "通过豆瓣登陆成功"
          sign_in_and_redirect @user, :event => :authentication, :notice => "登陆成功。"
        else
          redirect_to root_path, :notice => "抱歉，没有找到与之绑定的账号"
        end
      end

  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  protected
  
  def after_omniauth_failure_path_for resource
    root_path 
  end

end
