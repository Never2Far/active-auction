class Auction < ApplicationRecord
    scope :active, -> {where(active: true)}
    has_many :listings
    belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
    # has_many :items, through: :listings
    has_many :bids, through: :listings
    has_many :questions, through: : listings

    
    has_many :buyers, through: :bids
    has_many :sellers, through: :listings
    # has_many :users, through: :sellers, source: :listings
    # has_many :users, through: :buyers, source: :bids
    # has_many :auction_sellers
    # has_many :sellers, through: :authorized_sellers, class_name: 'User'
    def active
        DateTime.now.between?(self.start_date, self.end_date)
    end

    def status
        if self.active?
            return "Active"
        else
            return "Ended"
        end
    end

    def admin
        User.find(self.admin_id)
    end
end