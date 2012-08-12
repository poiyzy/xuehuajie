class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def destroy
    
  end

  def create
    
  end

  def noty_update
    type =  params[:type]
    if type == "num" 
      respond_to do |format|
      format.json {render :json => current_user.unread_timeline.length}
      end
    else
      @ids = current_user.unread_timeline.map do |t|
       t.id
      end
      @notice = Notification.find @ids
      @note = []
      @notice.each do |noty|
      case noty.event_type
      when "follow"
        @note << {:user_name => noty.actor.profile.user_name,:event_type => "follow",:user_id => noty.actor_id}
      end
    end
    respond_to do |format|
      format.json {render :json => @note.to_json}
    end
    
   

    end
 end
end
