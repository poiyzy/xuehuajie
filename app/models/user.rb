class User < ActiveRecord::Base
  include OmniauthCallbacks 
  include Timeline::Actor
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  has_one :profile
  has_many :authorizations
  has_many :avatars
  has_many :pictures

  def self.find_by_email(email)
    where(:email => email).first
  end
  def getting_started?
    self.getting_started
  end
end
