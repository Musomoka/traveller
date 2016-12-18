class CreatePlacesPhotos < ActiveRecord::Migration
  def change
    create_table :places_photos do |t|
      t.references :place, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true
    end
  end
end
