class HomeController < ApplicationController
  before_filter :getting_start!,:except => :email_confirm
  def index
    @pictures = current_user.pictures
  
  end
  def email_confirm
    @user_email = params[:user][:email]
    judge = User.find_by_email(@user_email).nil?
    respond_to do |format|
      format.js {render :json => judge }
    end
  end
 end
