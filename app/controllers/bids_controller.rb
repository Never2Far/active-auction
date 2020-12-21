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
    @bid.listing = @listing
    @bid.buyer = current_user

    
if @bid.errors?
    flash[:alert] = @bid.errors?.first
    redirect_to listing_path(@listing) and return
end

    unless !@bid.save
        redirect_to listing_path(@listing)
    else
        flash[:alert] = "Error"
        redirect_to listing_path(@listing)
    end

end

def update
end

private

def bid_params
    params.require(:bid).permit(:listing_id, :buyer_id, :amount, :max_bid, :new_max_bid)
end

end