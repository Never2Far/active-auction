class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :listing_id
      t.integer :buyer_id
      # t.integer :user_id
      t.decimal :amount
      t.decimal :max_bid
      t.boolean :winning_bid?

      t.timestamps
    end
  end
end
