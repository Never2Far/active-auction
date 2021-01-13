class ApplicationController < ActionController::Base

    def search
    render 'search'
    end

    def after_sign_in_path_for(resource)
        stored_location_for(resource) ||
    if resource.is_a?(User) && user_signed_in?
      '/dashboard'
    else
      super
    end
      end

      def set_end_date(auctionOrListing) #accepts instances of Auction or Listing
        t = auctionOrListing.start_time
        d = auctionOrListing.start_date
        auctionOrListing.start_date = DateTime.new(d.year, d.month, d.day, t.hour, t.min)
        auctionOrListing.end_date = (auctionOrListing.start_date + auctionOrListing.duration.days).strftime("%b %-d, %Y %H:%M")
    end
end
