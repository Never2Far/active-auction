class AddNameAndUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
  end
  # add_index :users, :username, unique: true
end
