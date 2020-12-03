class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :listing_id
      t.integer :auction_id
      t.string :category
      t.string :keywords

      t.timestamps
    end
  end
end
