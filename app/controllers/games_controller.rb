class GamesController <  ApplicationController
  def show
    if params.has_key?(:category)
      @category = GameCategory.find_by_slug(params[:category])
    end
    @game = Game.find_by_slug(params[:game])
  end
end