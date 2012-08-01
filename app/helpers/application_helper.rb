#coding: utf-8
module ApplicationHelper
  def page_title(text="雪花街|账号")
    content_for(:title) {text.to_s}
  end
  def user_name_link(user=current_user)
    if user.profile && user.profile.user_name
      link_to("#{user.profile.user_name}",user_path(user))
    else
      link_to("#{user.email}",user_path(user))
    end
  end
end
