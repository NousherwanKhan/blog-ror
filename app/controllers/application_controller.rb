class ApplicationController < ActionController::Base

    
  protected
    def after_sign_in_path_for(resource)
      if current_admin_user.role_id == 2
        blogs_path
      else
        root_path
      end
    end

end
