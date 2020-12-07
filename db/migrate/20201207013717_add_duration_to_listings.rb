class AddDurationToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :duration, :integer
  end
end
