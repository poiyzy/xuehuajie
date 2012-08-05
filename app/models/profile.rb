#coding: utf-8
class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthday,:gender, :searchable, :user_name,:state,:city,:school,:image_url_small,:avatar
  validates_presence_of :user_name
  validates_length_of :user_name, :within => 2..20
  validates_length_of :bio, :maximum => 1500 , :allow_blank => true
  validates_each :user_name, :school, :state, :city  do |record, attr, value|
    record.errors.add attr, '字段存在非法字符#&^*$% ' if value  =~ /[#\$%\^&\*]+/
  end

  attr_accessor :password, :crop_x, :crop_y, :crop_h, :crop_w
  after_update :reprocess_profile, :if => :cropping?

  mount_uploader :avatar, AvatarUploader
  
  
  belongs_to :user
  
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def profile_geometry
    img = MiniMagick::Image::read(self.profile.current_path).first
    @geometry = {:width => img.columns, :height => img.rows }
  end

  private

  def reprocess_profile
    self.profile.recreate_versions!
  end
  
end
