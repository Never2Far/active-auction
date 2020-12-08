class Listing < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    has_and_belongs_to_many :items
    has_many :bids
    belongs_to :auction


    def active?
        DateTime.now.between?(self.start_date, self.end_date)
    end


    def current_bid
        self.bids.any? ? self.bids.last : nil
    end

    def current_bid_amount
        if self.current_bid
            self.current_bid.amount
        else
            0.00
        end
    end

   def reserve_met?
       (self.current_bid_amount >= self.reserve_price)
   end

    def item
        self.items.first
    end

    # def auction
    #     Auction.find_by(id: self.auction_id)
    # end
end
