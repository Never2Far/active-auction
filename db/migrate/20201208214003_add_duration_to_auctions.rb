class AddDurationToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :duration, :integer
  end
end
