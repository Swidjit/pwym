class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :description
      t.string :instructions
      t.string :slug
      t.belongs_to :exercise_category
    end
  end
end
