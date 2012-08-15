class Album < ActiveRecord::Base
  attr_accessible :description, :pictures_count, :title, :user_id
end
