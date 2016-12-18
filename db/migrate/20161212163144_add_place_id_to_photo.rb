class AddPlaceIdToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :place, index: true, foreign_key: true
  end
end
