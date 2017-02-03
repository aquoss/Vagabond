class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

    def require_login
      unless !current_user.nil?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end

end
