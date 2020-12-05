class UsersController < ApplicationController
# before_action :set_user, only: [:show]


    def show
        @user = User.find_by(id: params[:id])
        if @user == current_user
            render 'dashboard'
        end
        
    end

    def dashboard
        if user_signed_in?
        @user = current_user
        else
            redirect_to '/sign_in'
        end
    end


    # def set_user
    #     @user = User.find_by(id: params[:id])
    # end

end