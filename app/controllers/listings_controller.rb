class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_for_cancel, :only => [:create, :update]

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.seller_id = current_user.id
        set_end_date(@listing)

        if @listing.save
            redirect_to listing_path(@listing)
        else

        flash[:alert] = "Something went wrong, please check information and try again."

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
        
            
    
            if @listing.update(listing_params)
                redirect_to listing_path(@listing)
            else
                redirect_to edit_listing_path(@listing)
            end
       
    end

    def destroy
        @listing = Listing.find_by(id: params[:id])
        if @listing.bids.any?
            @listing.bids.each do |bid|
                bid.destroy
            end
        end
        @listing.destroy
        redirect_to '/dashboard'
    end

private

def listing_params
    params.require(:listing).permit(:id, :item_id, :item_name, :title, 
        :description, :reserve_price, :start_date, 
        :end_date, :start_time, :end_time, :item_condition, 
        :item_qty, :lot_size, :active, :duration, :starting_bid,
        :bid_increment, :auction_id)
end

def set_end_date(listing)
    t = listing.start_time
    d = listing.start_date
    listing.start_date = DateTime.new(d.year, d.month, d.day, t.hour, t.min)
    listing.end_date = (listing.start_date + listing.duration.days).strftime("%b %-d, %Y %H:%M")
end

def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to '/dashboard'
    end
  end
end
