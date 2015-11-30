class GameCategoriesController <  ApplicationController
  def show
    @category = GameCategory.find_by_slug(params[:id])
    render 'games/category'
  end
end