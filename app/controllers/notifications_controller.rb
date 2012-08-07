


class NotificationsController < ApplicationController
  def noty_update
    respond_to do |format|
      format.js {render :json => true}
    end
    
  end
end
