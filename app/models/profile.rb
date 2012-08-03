class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthday,:gender, :location, :searchable, :user_name,:state,:city,:school
  validates_presence_of :gender,:user_name,:city,:state
  validates_length_of :user_name, :within => 2..30

  
  
  belongs_to :user

  
end
