class Cities < ActiveRecord::Migration
  	 def change
    create_table :Cities do |t|
    t.string :city
    t.integer :country_id
    end
  end
end
