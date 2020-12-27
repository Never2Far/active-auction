class Listing < ApplicationRecord
    scope :active, -> {where(active: true)}
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    has_and_belongs_to_many :items
    has_many :bids
    belongs_to :auction

    validates :title, :description, :start_time, :start_date, :duration, presence: true


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

    def next_valid_bid
        if self.current_bid_amount == 0
            self.starting_bid
        else
            self.current_bid_amount + self.bid_increment
        end
    end

   def reserve_met?
    if self.current_bid
        self.current_bid_amount >= self.reserve_price ? true : false
    else
        false
    end
   end

    def item
        self.items.first
    end

    # def auction
    #     Auction.find_by(id: self.auction_id)
    # end
end
