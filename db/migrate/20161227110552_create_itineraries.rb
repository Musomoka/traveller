class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      
      t.references :tour, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
        
      t.timestamps null: false
    end
  end
end
