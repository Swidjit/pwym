class ArticlesController < ApplicationController

  def show
    @article = Article.find_by_slug(params[:id])
    @category = Category.find_by_slug(params[:category])
    @comments = @article.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@article, current_user.id, "") if user_signed_in?
  end

  def index
    @category = Category.find_by_slug(params[:id])
    @articles = @category.articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to :controller => :articles, :action => :show, :category => 'site-news',:id=>@article.slug
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id, :template, :image)
  end

end
