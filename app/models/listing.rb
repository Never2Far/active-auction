class Listing < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_user_id'
    has_and_belongs_to_many :items
    has_many :bids
end
