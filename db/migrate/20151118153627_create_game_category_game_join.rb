class CreateGameCategoryGameJoin < ActiveRecord::Migration
  def change
    create_table :games_game_categories, id: false do |t|
      t.integer :game_id
      t.integer :game_category_id
    end
  end
end
