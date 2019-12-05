class ApplicationController < ActionController::Base
  layout :layout_for_devise
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_picture])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  include Pundit

  def after_sign_in_path_for(resource)
     movies_path
  end

  def after_sign_up_path_for(scope)
    movies_path
  end

  private

  def layout_for_devise
    "application_home" if devise_controller?
  end
end
