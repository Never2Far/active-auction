class AddBidIncrementToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :bid_increment, :decimal
  end
end
