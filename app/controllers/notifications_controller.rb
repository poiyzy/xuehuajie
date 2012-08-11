


class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def destroy
    
  end

  def create
    
  end

  def noty_update
    respond_to do |format|
      format.js {render :json => true}
    end
    
  end
end
