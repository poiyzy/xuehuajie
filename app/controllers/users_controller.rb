class UsersController < ApplicationController
  before_filter :getting_start!, :except => [:start,:bind_auth]

  def show
    @cu = current_user
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def account

  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def bind_auth
    render :layout => 'devise'
  end

end
