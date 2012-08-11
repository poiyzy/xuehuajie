class Notification < ActiveRecord::Base
  attr_accessible :message, :actor, :subject, :secondary_subject, :type
  belongs_to :actor,              :polymorphic => true
  belongs_to :subject,            :polymorphic => true
  belongs_to :secondary_subject,  :polymorphic => true

end
