class AuctionsController < ApplicationController
    # protect_from_forgery
    # before_action :authenticate_user!



    def index
        @auctions = Auction.all
    end

    def new
        @auction = Auction.new
    end

    def create
        @auction = Auction.new(auction_params)

        if @auction.save
            redirect_to auction_path(@auction)
        end

        redirect_to new_auction_page
    end

    def show
        @auction = Auction.find_by(id: params[:id])
    end

    private

    def auction_params
        params.require(:auction).permit(:name, :organization, :private, :type, :start_time, :end_time, :admin_id)
    end

end
