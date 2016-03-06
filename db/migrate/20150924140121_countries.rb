class Countries < ActiveRecord::Migration
  def change
  	 create_table :Countries do |t|
    t.string :country
 
    end
  end
end
