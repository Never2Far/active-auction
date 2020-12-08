class AuctionsController < ApplicationController
    # protect_from_forgery
    before_action :authenticate_user!
    before_action :check_for_cancel, :only => [:create, :update]



    def index
        @auctions = Auction.all
    end

    def new
        @auction = Auction.new
    end

    def create
        @auction = Auction.new(auction_params)
        @auction.admin_id = current_user.id

        if @auction.save
            redirect_to auction_path(@auction)
        else

        redirect_to new_auction_path
        end
    end

    def show
        @auction = Auction.find_by(id: params[:id])
    end

    def edit
        @auction = Auction.find_by(id: params[:id])
    end

    def update
        @auction = Auction.find_by(id: params[:id])

        if @auction.update(auction_params)
            redirect_to auction_path(@auction)
        else
            redirect_to edit_auction_path(@auction)
        end
    end

    private

    def auction_params
        params.require(:auction).permit(:name, :organization, :private, :type, :start_time, :end_time, :admin_id)
    end

    def check_for_cancel
        if params[:commit] == "Cancel"
          redirect_to '/dashboard'
        end
      end

end
