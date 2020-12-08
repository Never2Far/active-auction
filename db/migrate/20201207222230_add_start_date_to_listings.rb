class AddStartDateToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :start_date, :datetime
  end
end
