class AddRequiredContributionToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :required_contribution, :integer
  end
end
