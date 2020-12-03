class Auction < ApplicationRecord
    has_many :listings
    belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
    has_many :items, through: :listings
    has_many :bids, through: :listings
end
