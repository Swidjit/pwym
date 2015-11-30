class ArticlesController < ApplicationController

  def show
    @article = Article.find_by_slug(params[:id])
  end

end
