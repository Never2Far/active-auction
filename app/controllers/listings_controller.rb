class ListingsController < ApplicationController


    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)

        if @listing.save
            redirect_to listing_path(@listing)
        end

        #error

        redirect_to new_listing_path

    end

    def show
        @listing = Listing.find_by(id: params[:id])
        render 'listings/show'
    end

private

def listing_params
    params.require(:listing).permit(:id, :item_id, :item_name, :title, :description, :reserve_price, :start_time, :end_time, :item_condition, :item_qty, :lot_size, :active)
end


end
