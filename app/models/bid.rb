class Bid < ApplicationRecord
    belongs_to :listing
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
    # has_one :auction, through: :listing

    # def buyer
    #     User.find_by(id: self.buyer_id)
    # end

    def errors?
        errors = []
        if self.buyer == self.listing.seller
            errors << "You cannot bid on your own listing!"
        # elsif (self.amount <= self.listing.current_bid_amount)
        # errors << "Invalid bid: Please enter a bid greater than the listing\'s current bid"
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
        if self.listing.current_bid == self
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