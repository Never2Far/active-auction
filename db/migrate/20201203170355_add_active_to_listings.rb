class AddActiveToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :active, :boolean
  end
end
