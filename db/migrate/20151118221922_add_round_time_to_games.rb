class AddRoundTimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :round_time, :integer
    add_column :games, :instructions, :text
    change_column :games, :popularity, :integer, :default => 0
  end
end
