class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthday,:gender, :location, :searchable, :user_name,:state,:city,:school,:image_url_small
  validates_presence_of :user_name
  validates_length_of :user_name, :within => 2..20

  
  
  belongs_to :user

  
end
