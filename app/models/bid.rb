class Bid < ApplicationRecord
    belongs_to :listing
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
    # has_one :auction, through: :listing

    # def buyer
    #     User.find_by(id: self.buyer_id)
    # end

    def display
        "#{self.listing.title}, Bid: $#{self.amount} (Max Bid: $#{self.max_bid})"
    end


end