class ArticlesController < ApplicationController

  def show
    @article = Article.find_by_slug(params[:id])
    @category = Category.find_by_slug(params[:category])
  end

  def index
    @category = Category.find_by_slug(params[:id])
    @articles = @category.articles
  end

end
