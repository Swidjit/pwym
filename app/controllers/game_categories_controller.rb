class GameCategoriesController <  ApplicationController
  def show
    @category = GameCategory.find_by_slug(params[:id])
    @games = @category.games
    render 'games/category'
  end

  def index
    @categories = GameCategory.all.order(id: :asc)
  end
end