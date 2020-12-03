class Listing < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_user_id'
end
