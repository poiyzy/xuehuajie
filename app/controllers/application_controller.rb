class ApplicationController < ActionController::Base
  layout :layout_for_devise

  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
        return home_path
  end

  def layout_for_devise
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


  def getting_start!
    if current_user
      unless current_user.getting_started?
        redirect_to getting_start_users_path  
      end
    else
      authenticate_user!
    end
  end
end
