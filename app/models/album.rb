class Album < ActiveRecord::Base
  attr_accessible :description,  :title
  belongs_to :user
  has_many :pictures

  def cover
    return nil if pictures.empty?
    @cover = pictures.where(:cover => true).first
    if @cover.nil?
      @cover_picture = pictures.all.sort_by{|s| s.like_count}.first
      @cover_picture.image.url(:cover)
    else
      @cover.image.url(:cover) 
    end
  end

  def set_cover(cover_id)
    return true if pictures.empty?
    self.pictures.where("id != ?", cover_id).each do |p|
      p.update_attribute :cover, false
    end 
    self.pictures.find(cover_id).update_attribute :cover, true
  end

end
