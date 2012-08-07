#coding: utf-8
class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthday,:gender, :searchable, :user_name,:state,:city,:school,:image_url_small,:avatar
  validates_presence_of :user_name
  validates_length_of :user_name, :within => 2..20
  validates_length_of :bio, :maximum => 1500 , :allow_blank => true
  validates_each :user_name, :school, :state, :city  do |record, attr, value|
    record.errors.add attr, '字段存在非法字符#&^*$% ' if value  =~ /[#\$%\^&\*]+/
  end

  
 
  belongs_to :user
  has_many :avatars

    
end
