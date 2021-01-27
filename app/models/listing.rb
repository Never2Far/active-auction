class Listing < ApplicationRecord
    scope :active, -> {where("start_date < ?", Time.now).where("end_date > ?", Time.now)}

        
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    has_many :bids
    belongs_to :auction
    has_many :questions

    # validates :title, :description, :start_time, :start_date, :duration, presence: true
    # validates :duration, numericality: {only_integer: true}
    # validates :title, length: {in: 3..50}
    # validates :starting_bid, :reserve_price, prese

    def update_status
        if self.active? 
            self.active = true  
        else 
            self.active = false
        end
        self.save!
    end

    def active?
        DateTime.now.between?(self.start_date, self.end_date)
    end

    def status
        if self.active?
            return "Active"
        else
            if DateTime.now < self.start_date #&& self.draft?
            return "Not Started"
            else  
                return self.outcome
            end
        end
    end

    def outcome
        if self.reserve_met?
             return "Ended--Final Bid: #{number_to_currency(self.current_bid_amount)} by #{self.current_bid.buyer.username}"
        else
            return "Ended--Reserve Not Met"
        end
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
end
