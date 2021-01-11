class AddActiveToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :active, :boolean
  end
end
