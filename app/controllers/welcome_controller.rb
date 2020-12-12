class WelcomeController < ApplicationController
protect_from_forgery
before_action :authenticate_user!

def home
    if user_signed_in?
        @user = current_user
        redirect_to '/dashboard'
    end
end

end