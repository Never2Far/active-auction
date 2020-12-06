class RenameSellerIdInListings < ActiveRecord::Migration[6.0]
    
def up
    rename_column :listings, :seller_user_id, :seller_id
end

def down
    rename_column :listings, :seller_id, :seller_user_id
end


end