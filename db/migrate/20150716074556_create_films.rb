class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
    t.text :description
    t.integer :year
    t.integer :user_id
    t.string  :language
    t.string  :actor
    t.string :subtitle
    t.attachment :uploaded_file
    t.attachment :down_file
    t.string :category
    t.boolean :send_new_film, default: true
    t.timestamps null: false
    end
  end
end
