class CreateGameCategoriesGames < ActiveRecord::Migration
  def change
    create_table :game_categories_games, id: false do |t|
      t.integer :game_id
      t.integer :game_category_id
    end
    drop_table :games_game_categories
  end
end
