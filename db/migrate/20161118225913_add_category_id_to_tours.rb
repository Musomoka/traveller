class AddCategoryIdToTours < ActiveRecord::Migration
  def change
    add_reference :tours, :category, index: true, foreign_key: true
    add_reference :tours, :guide, index: true, foreign_key: true
    add_reference :tours, :place, index: true, foreign_key: true
  end
end
