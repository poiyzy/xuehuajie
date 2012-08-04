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
        if current_user.authorizations.all.empty?
          redirect_to bindding_users_path
        else
          redirect_to getting_start_path
        end
      end
    else
      authenticate_user!
    end
  end

  def bind_with?(provider)
    current_user.authorizations.where(:provider => provider).first
  end
end
