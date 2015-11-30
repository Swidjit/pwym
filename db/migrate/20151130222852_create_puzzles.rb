class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzle_categories do |t|
      t.string :title
      t.string :description
      t.string :instructions
      t.string :slug
      t.integer :count
    end
  end
end
