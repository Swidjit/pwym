class AddSlugToGameCategories < ActiveRecord::Migration
  def change
    add_column :game_categories, :slug, :string
    add_column :categories, :slug, :string

  end
end
