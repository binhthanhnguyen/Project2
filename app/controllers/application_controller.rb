class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # include SessionsHelper
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
	  if current_user.role? :admin
	    rails_admin.dashboard_path
	  else
	    main_app.root_path
	  end
  end
end
