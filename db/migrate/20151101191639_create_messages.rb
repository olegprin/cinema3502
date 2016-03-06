class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :user_to

      t.timestamps null: false
    end
  end
end
