class AddSlugToGameCategories < ActiveRecord::Migration
  def change
    add_column :game_categories, :slug, :string
  end
end
