class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :tour_name
      t.text :description

      t.timestamps null: false
    end
  end
end
