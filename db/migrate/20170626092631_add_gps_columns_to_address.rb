class AddGpsColumnsToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :integer
    add_column :addresses, :longatude, :integer
  end
end
