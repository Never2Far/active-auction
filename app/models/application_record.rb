class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def number_to_currency(number)
    ActiveSupport::NumberHelper.number_to_currency(number)
  end

  def set_end_date(auctionOrListing) #accepts instances of Auction or Listing
    t = auctionOrListing.start_time
    d = auctionOrListing.start_date
    auctionOrListing.start_date = DateTime.new(d.year, d.month, d.day, t.hour, t.min)
    auctionOrListing.end_date = (auctionOrListing.start_date + auctionOrListing.duration.days).strftime("%b %-d, %Y %H:%M")
  end
  
end
