#coding: utf-8
module UsersHelper
  
  def is_current_user?(user)
    current_user.id == user.id
  end

  def follow_link(user)
    unless current_user.has_followed?(user.id)
       link_to "关注",follow_create_path(user),:method => :post,:remote => true,:id => "concern"
    else
       link_to "取消关注", follow_destroy_path(user) ,:method => :delete,:remote => true ,:id => "concern"
    end
  end

  def current_avatar(size= 200)
    user_avatar(current_user,size) 
  end

  def user_avatar(user,size=200)
    if user.avatars.where(:active => true).first.nil? 
      return image_tag( image_path("37.jpg"))
    end
    case size
    when 200
      image_tag(user.avatars.where(:active => true).first.logo(:user), :id => "current_avatar_img") 
    when 75
      image_tag(user.avatars.where(:active => true).first.logo(:actor ), :id => "current_avatar_img") 
    when 20
      image_tag(user.avatars.where(:active => true).first.logo(:representation), :id => "current_avatar_img") 
    else
      image_tag(user.avatars.where(:active => true).first.logo, :id => "current_avatar_img") 
    end
    
  end
end
