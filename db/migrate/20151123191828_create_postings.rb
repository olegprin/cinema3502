class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :user_id
      t.integer :blog_id
      t.string :body
      t.attachment :cover_picture
      t.string :recipient_group_ids,  array: true, default: []
      t.string :recipient_ids,  array: true, default: []
      t.string :title
      t.time :publish_at
      t.time :expire_at
      t.boolean :is_draft, :default => true
      t.timestamps null: false
    end
  end
end
