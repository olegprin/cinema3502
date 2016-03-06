class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :text
      t.string :email
      t.string :name
      t.string :token

      t.timestamps null: false
    end
  end
end
