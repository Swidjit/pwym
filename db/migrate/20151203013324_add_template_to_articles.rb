class AddTemplateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :template, :string, :default => 'main'
  end
end
