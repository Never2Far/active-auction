class ListingsController < ApplicationController


    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)

        if @listing.save
            redirect_to listing_path(@listing)
        else

        #error

        redirect_to new_listing_path
        end
    end

    def show
        @listing = Listing.find_by(id: params[:id])
        @bid = Bid.new(listing_id: params[:id])
        render 'listings/show'
    end

    def edit
        @listing = Listing.find_by(id: params[:id])
    end

    def update
        @listing = Listing.find_by(id: params[:id])
        @listing.update(listing_params)
        redirect_to listing_path(@listing)
    end

private

def listing_params
    params.require(:listing).permit(:id, :item_id, :item_name, :title, :description, :reserve_price, :start_time, :end_time, :item_condition, :item_qty, :lot_size, :active, :duration)
end


end
