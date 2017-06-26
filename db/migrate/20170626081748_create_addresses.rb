class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :place, index: true, foreign_key: true
      t.string :phy_address1
      t.string :phy_address2
      t.string :phy_address3
      t.string :region
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
