class AddFolderIdToLoads < ActiveRecord::Migration
 def self.up 
    add_column :loads, :folder_id, :integer
    add_index :loads, :folder_id
  end
  
  def self.down 
    remove_column :loads, :folder_id
  end
end
