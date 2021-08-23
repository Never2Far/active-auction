class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.text :title
      t.text :description
      # t.integer :user_id
      t.integer :seller_id
      t.integer :auction_id
      t.decimal :reserve_price
      t.decimal :bid_increment
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :start_date
      t.datetime :end_date
      t.integer :starting_bid
      t.integer :winning_bid_id
      t.text :item_condition
      t.integer :item_qty
      t.integer :lot_size
      t.boolean :active
      t.text :status
      t.integer :duration
      t.timestamps
    end
  end
end
