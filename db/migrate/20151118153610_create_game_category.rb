class CreateGameCategory < ActiveRecord::Migration
  def change
    create_table :game_categories do |t|
      t.string :title
      t.string :description
    end
  end
end
