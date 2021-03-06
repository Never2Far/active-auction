class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_for_cancel, :only => [:create, :update]

    def new
        @listing = Listing.new
        if params[:auction_id]
            @listing.auction_id = params[:auction_id]
        end
        @listing
    end

    def create
        auction = Auction.find_by(id: params[:auction_id])
        @listing = Listing.new(listing_params)
        if auction
            @listing.auction_id = auction.id
        end
        @listing.seller_id = current_user.id
        set_end_date(@listing)
        @listing.active? ? @listing.active = true : @listing.active = false 
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
        @question = Question.new(listing_id: params[:id], buyer_id: current_user.id )
        render 'listings/show'
    end

    def edit
        @listing = Listing.find_by(id: params[:id])
        if @listing.bids.any?
            flash[:alert] = "A listing cannot be edited once it has been bid on."
            redirect_to listing_path(@listing)
        end
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
            flash[:alert] = "A listing cannot be edited once it has been bid on."
            redirect_to listing_path(@listing)
        else
        @listing.destroy
        redirect_to '/dashboard'
        end
    end

    def index
    @listings = Listing.all
    end

    def index_active
        @listings = Listing.active
        render 'listings/index'
    end

private

def listing_params
    params.require(:listing).permit(:id, :item_id, :item_name, :title, 
        :description, :reserve_price, :start_date, 
        :end_date, :start_time, :end_time, :item_condition, 
        :item_qty, :lot_size, :active, :duration, :starting_bid,
        :bid_increment, :auction_id)
end

def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to '/dashboard'
    end
  end
end
