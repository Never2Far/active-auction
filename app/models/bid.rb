class Bid < ApplicationRecord
    belongs_to :listing
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

    def errors?
        errors = []
        if self.buyer == self.listing.seller
            errors << "You cannot bid on your own listing!"
        elsif (self.amount < (self.listing.next_valid_bid))
            errors << "Invalid bid: Please enter a bid of #{number_to_currency(self.listing.next_valid_bid)} or more"
        end
        if errors.any?
            return errors
        else
            return false
        end
    end

    def dashboard_display
        if !self.listing.active? && !self.listing.reserve_met?
            "(Ended) - Reserve not met - Final Bid: #{number_to_currency(self.listing.current_bid_amount)}"
        elsif self.listing.current_bid == self || self.listing.current_bid.buyer == self.buyer
            if self.listing.active?
            "(Active) - You are the highest bidder! - Current Bid: #{number_to_currency(self.listing.current_bid_amount)}"    
            else
            "(Ended) - You have Won! - Final Bid: #{number_to_currency(self.listing.current_bid_amount)}"    
            end
        else
            if self.listing.active?
            "(Active) - You have been out-bid! - Current Bid: #{number_to_currency(self.listing.current_bid_amount)}"    
            else
            "(Ended) - You did not win - Final Bid: #{number_to_currency(self.listing.current_bid_amount)}"    
            end
        end
    end
end