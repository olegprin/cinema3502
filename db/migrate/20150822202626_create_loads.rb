class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.integer :user_id
      t.attachment :uploaded_file
      t.timestamps null: false
    end
  end
end
