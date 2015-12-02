class CreateMemoryWorkouts < ActiveRecord::Migration
  def change
    create_table :memory_workouts do |t|
      t.string :title
      t.string :description
      t.string :instructions
      t.string :slug
    end
  end
end
