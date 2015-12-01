class CreateExerciseCategories < ActiveRecord::Migration
  def change
    create_table :exercise_categories do |t|
      t.string :title
      t.string :description
      t.string :slug
    end
  end
end
