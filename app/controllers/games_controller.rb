class GamesController <  ApplicationController
  def show
    if params.has_key?(:category)
      @category = GameCategory.find_by_slug(params[:category])
      puts @category
    end
    if params.has_key?(:game)
      @game = Game.find_by_slug(params[:game])
    else
      render 'games/category'
    end
  end
end