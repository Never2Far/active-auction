class ChangeStartingBidIdInListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :starting_bid_id, :integer
    add_column :listings, :starting_bid, :decimal
  end
end
