class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user
      t.belongs_to :match
      t.integer :session_id
      t.float :raw_score, :default => 0
      t.float :score, :default => 0
      t.float :percentile, :default => 0
      t.string :status, :default => 'enrolled'
    end
  end
end
