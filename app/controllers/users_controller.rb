class UsersController < ApplicationController
# before_action :set_user, only: [:show]


    def show
        @user = User.find_by(id: params[:id])
    end




    # def set_user
    #     @user = User.find_by(id: params[:id])
    # end

end