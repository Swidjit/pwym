class PuzzleCategoriesController <  ApplicationController
  def show_puzzle
    @puzzle = PuzzleCategory.find_by_slug(params[:puzzle])
    @game_num = params[:id].split('-').last
    render 'puzzles/'+@puzzle.slug
  end

  def show
    @puzzle = PuzzleCategory.find_by_slug(params[:puzzle])
    render 'puzzles/show'
  end

  def index
    @puzzles = PuzzleCategory.all
    render 'puzzles/index'
  end

end