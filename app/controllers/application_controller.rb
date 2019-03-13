class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
      if current_user.usertype == "instructor"
        indashboard_path
      end
    end
end
