class Notification < ActiveRecord::Base
  attr_accessible :message, :object, :target, :type, :user_id
  belongs_to :user
end
