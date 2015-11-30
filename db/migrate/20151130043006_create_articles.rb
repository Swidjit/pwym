class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :null=>:false
      t.text :body, :null=>:false
      t.string :slug, :null=>:false
      t.belongs_to :user
      t.belongs_to :category
      t.timestamps
    end
  end
end
