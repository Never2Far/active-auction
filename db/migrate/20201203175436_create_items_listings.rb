class CreateItemsListings < ActiveRecord::Migration[6.0]
  def change
    create_table :items_listings do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :listing, null: false, foreign_key: true
    end
  end
end
