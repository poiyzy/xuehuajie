class Picture < ActiveRecord::Base
  attr_accessible :description, :gid, :name, :user_id
end
