class UsersController < ApplicationController
  #before_filter :getting_start!, :except => :start

  def show
  end

  def account

  end
 
  def start
    render :layout => 'devise'
  end

end
