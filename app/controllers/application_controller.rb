class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  protected
    def after_sign_in_path_for(resource)
      if current_user.usertype == "instructor"
        indashboard_path
      else
        stdashboard_path
      end
    end

  private def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
