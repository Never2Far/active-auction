class BidsController < ApplicationController
    before_action :authenticate_user!


def index
    @bids = Bid.all
end

def show
    @bid = Bid.find_by(id: params[:id])
end

def create
    @bid = Bid.new(bid_params)
    @listing = Listing.find(params.require(:listing_id))
    if @bid.amount <= @listing.current_bid.amount
        flash[:alert] = "Invalid bid: Please enter a bid greater than the listing\'s current bid"
        redirect_to listing_path(@listing) and return
    end
    @bid.listing = @listing
    @bid.buyer = current_user

    unless !@bid.save
        redirect_to listing_path(@listing)
    else
        flash[:alert] = "Error"
        redirect_to listing_path(@listing)
    end

end


private

def bid_params
    params.require(:bid).permit(:listing_id, :buyer_id, :amount, :max_bid)
end

end