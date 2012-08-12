class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :gid, :name, :image
  has_attached_file :image,
  :styles => { :cover => ["300x225#",:jpg],:thumb => ["125x125#",:jpg],:presentation => ["800x800>",:jpg] },
  :default_url => "/assets/pictures/:style/:subtype_class.png"
  validates_attachment_presence :image

  belongs_to :user
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.url(:cover),
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
