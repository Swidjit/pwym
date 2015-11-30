class GameCategoriesController <  ApplicationController
  def show
    @category = GameCategory.find_by_slug(params[:id])
    @games = @category.games
    render 'games/category'
  end
end