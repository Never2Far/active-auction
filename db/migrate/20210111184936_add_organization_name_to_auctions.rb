class AddOrganizationNameToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :organization_name, :string
  end
end
