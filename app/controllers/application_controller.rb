class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :permitted_parameters, if: :devise_controller? 

  protected
		def permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
			#These are the parameters which can be updated after clicking on the update/edit account option
			devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description, :email, :password])
		end 
end
