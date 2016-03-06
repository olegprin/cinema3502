class AddOmniauthToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_index :users, :uid
    add_index :users, :provider
  end

   def self.down
        remove_column :users, :provider
        remove_column :users, :uid
  end
end
