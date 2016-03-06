class AddCountryToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :country, :string
  end
end
