class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  
  attr_accessible :user_id,:comment,:title
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  validates_presence_of :user_id,:comment ,:commentable_id, :commentable_type
  belongs_to :user
end
