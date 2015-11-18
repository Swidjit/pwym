class CreateGamesMatchesJoin < ActiveRecord::Migration
  def change
    create_table :games_matches, id: false do |t|
      t.integer :game_id
      t.integer :match_id
    end
  end
end
