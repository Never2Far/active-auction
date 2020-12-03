class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :organization
      t.boolean :private
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :admin_id

      t.timestamps
    end
  end
end
