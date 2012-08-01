class Profile < ActiveRecord::Base
  attr_accessible :account_setted, :bio, :birthday, :follower_num, :gender, :location, :searchable, :user_name
  validates_length_of :user_name, :within => 2..30
  validates_presence_of :gender
  
  belongs_to :user
  
end
