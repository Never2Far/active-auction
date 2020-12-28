class ApplicationController < ActionController::Base

    def search
    render 'search'
    end

    def after_sign_in_path_for(resource)
        stored_location_for(resource) ||
    if resource.is_a?(User) && user_signed_in?
      '/dashboard'
    else
      super
    end
      end
end
