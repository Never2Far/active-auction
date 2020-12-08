class AddEndDateToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :end_date, :datetime
  end
end
