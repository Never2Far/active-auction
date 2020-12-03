class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :seller_user_id
      t.integer :auction_id
      t.decimal :reserve_price
      t.datetime :start_time
      t.datetime :end_time
      t.integer :starting_bid_id
      t.integer :winning_bid_id
      t.string :item_condition
      t.integer :item_qty
      t.integer :lot_size

      t.timestamps
    end
  end
end
