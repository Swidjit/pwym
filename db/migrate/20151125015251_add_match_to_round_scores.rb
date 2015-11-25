class AddMatchToRoundScores < ActiveRecord::Migration
  def change
    add_column :round_scores, :match_id, :integer
  end
end
