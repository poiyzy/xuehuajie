class Authorization < ActiveRecord::Base
  attr_accessible :uid, :provider
  belongs_to :user
end
