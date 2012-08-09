class Picture < ActiveRecord::Base
  attr_accessible :description, :gid, :name, :image
   has_attached_file :image,
    :styles => {
      :thumb => "100x100#" },
    :convert_options => {
      :thumb => "-quality 75 -strip" }
  def to_jq_upload
    {
      "name" => read_attribute(:avatar),
      "size" => avatar.size,
      "url" => avatar.url,
      "thumbnail_url" => avatar.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
