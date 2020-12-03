class Auction < ApplicationRecord
    has_many :listings
    belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
end
