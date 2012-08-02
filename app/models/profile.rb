class Profile < ActiveRecord::Base
  attr_accessible :account_setted, :bio, :birthday,:gender, :location, :searchable, :user_name,:state,:city
  validates_presence_of :gender,:user_name
  validates_length_of :user_name, :within => 2..30


  
  
  belongs_to :user

  
end
