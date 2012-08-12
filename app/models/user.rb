class User < ActiveRecord::Base
  include TimelineNotify::Actor
  include OmniauthCallbacks 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  has_many :follows, :foreign_key => "follower_id", :class_name => "Follow", :dependent => :destroy
  has_many :users_followed, :through => :follows, :source => :followed
 
  has_many :followings, :foreign_key => "followed_id", :class_name => "Follow", :dependent => :destroy
  has_many :users_following, :through => :followings, :source => :follower

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  has_one :profile
  has_many :authorizations
  has_many :avatars
  has_many :pictures
  has_many :notifications, :as => :actor
  def self.find_by_email(email)
    where(:email => email).first
  end
  def getting_started?
    self.getting_started
  end

  def follow(following)

    if User.find following
      self.follows.create(:followed_id => following)
    else
      return false
    end
  end
  
  def unfollow(user_id)
    if self.has_followed?(user_id)
      if Follow.where(:followed_id => user_id,:follower_id => self.id).first.destroy
        true
      else
        false
      end
    else
      false
    end
  end

  def has_followed?(user_id)
    if Follow.where(:followed_id => user_id,:follower_id => self.id).first.nil?
      return false
    else
      return true
    end
    
  end

  def was_followed?(user_id)
    if Follow.where(:followed_id => self.id ,:follower_id => user_id).first.nil?
      return false
    else
      return true
    end
  end  

  def followers
    self.users_followed
  end

  def followings
    self.users_following
  end
end
