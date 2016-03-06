class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
