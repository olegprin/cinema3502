class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.boolean :allow_comments, default: true
      t.boolean :allow_public_comments, default: true
      t.string :role
      t.string :name
      t.string :content
      t.integer :user_id
      t.string :title
      t.string :synopsis
      t.time :publish_at
      t.time :expire_at
      t.attachment :cover_picture
      t.boolean :is_draft, :default => true
      t.timestamps null: false
    end
  end
end
