class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.text :name
      # t.text :organization
      t.boolean :private?
      t.text :type
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :admin_id

      t.timestamps
    end
  end
end
