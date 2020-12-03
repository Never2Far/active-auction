class Bid < ApplicationRecord
    belongs_to :listing
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
    # has_one :auction, through: :listing
end