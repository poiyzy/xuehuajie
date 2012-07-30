class Profile < ActiveRecord::Base
  attr_accessible :account_setted, :bio, :birthday, :follower_num, :gender, :heat, :image_url, :image_url_middle, :image_url_small, :location, :searchable, :user_id, :user_name
end
