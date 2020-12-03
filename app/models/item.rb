class Item < ApplicationRecord
    has_and_belongs_to_many :listings
    belongs_to :auction
end
