module UsersHelper
  def current_avatar(size= 200)
    if current_user.avatars.where(:active => true).first.nil?
      return image_tag(asset_path("37.jpg"),:id => "no_avatar_img")
    end
    case size
    when 200
      image_tag(current_user.avatars.where(:active => true).first.logo(:user), :id => "current_avatar_img") 
    when 75
      image_tag(current_user.avatars.where(:active => true).first.logo(:actor ), :id => "current_avatar_img") 
    when 20
      image_tag(current_user.avatars.where(:active => true).first.logo(:representation), :id => "current_avatar_img") 
    else
      image_tag(current_user.avatars.where(:active => true).first.logo, :id => "current_avatar_img") 
    end
  end
end
