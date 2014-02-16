class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all

  # permitted devise parameters
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :years, :address, :city, :state, :zip, :school, :years, :type, :code, :email, :password, :password_confirmation ) }
  end

  def custom_cancan_signin
    if current_user.type == 'Customer'
      redirect_to(:controller => 'appointments', :action => 'index')
    end
  end

  def custom_cancan(types)
    unless types.include? current_user.type
      redirect_to(:controller => 'members', :action => 'index')
    end
  end
end
