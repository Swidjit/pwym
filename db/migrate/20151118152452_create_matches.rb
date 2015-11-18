class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :start_time
      t.string :title
      t.string :mode, :default => 'free'
      t.integer :capacity, :default => 100
      t.integer :entry_count, :default => 0
      t.integer :entry_cost
    end
  end
end
