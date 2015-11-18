class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.integer :popularity
      t.string :slug
      t.timestamps
    end
  end
end
