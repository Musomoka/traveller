class AddColumnsToPlaces < ActiveRecord::Migration
  def change
   
    add_column :places, :description, :text
    add_column :places, :url, :string
  end
end
