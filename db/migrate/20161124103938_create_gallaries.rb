class CreateGallaries < ActiveRecord::Migration
  def change
    create_table :gallaries do |t|
       t.string :name
      t.string :link
      t.boolean :main_image
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
