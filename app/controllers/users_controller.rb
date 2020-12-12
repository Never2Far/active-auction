class UsersController < ApplicationController
# before_action :set_user, only: [:show]


    def show
        @user = User.find_by(id: params[:id])
        if @user == current_user
            redirect_to '/dashboard'
        else
        redirect_to user_path(@user)
        end
    end

    def dashboard
        if user_signed_in?
        @user = current_user
        else
            redirect_to '/sign_in'
        end
    end

    def update
        @user = User.find_by(id: params[:id])

        @user.update(username: user_params[:username])
        # @user.username = user_params[:username]
        redirect_to '/dashboard'
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end