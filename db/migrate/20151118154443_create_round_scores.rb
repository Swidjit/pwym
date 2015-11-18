class CreateRoundScores < ActiveRecord::Migration
  def change
    create_table :round_scores do |t|
      t.belongs_to :user
      t.belongs_to :entry
      t.belongs_to :game
      t.integer :session_id
      t.float :raw_score
      t.float :score
      t.float :percentile
    end
  end
end
