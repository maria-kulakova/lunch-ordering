class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    users_path
  end
end
