class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.references :user, index: true, foreign_key: true
      t.string :avatar
      t.references :organisation, index: true, foreign_key: true
      t.text :bio

      t.timestamps null: false
    end
  end
end
