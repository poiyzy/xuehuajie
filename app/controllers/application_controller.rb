class ApplicationController < ActionController::Base
  layout :layout_for_devise

  protect_from_forgery

  protected

  def layout_for_devise
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
