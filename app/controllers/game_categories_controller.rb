class GameCategoriesController <  ApplicationController
  def show
    puts params[:id]
    if params[:id] == 'brain-fitness-games'
      redirect_to :controller => :exercise_categories, :action => :index
    elsif params[:id] == 'memory-workout-program'
      redirect_to :controller => :exercise_categories, :action => :index
    elsif params[:id] == 'puzzles-brainteasers'
      redirect_to :controller => :puzzle_categories, :action => :index
    elsif params[:id] == 'brain-fitness-tips'
      redirect_to :controller => :articles, :action => :index, :id => 'brain-fitness-tips'
    else
      @category = GameCategory.find_by_slug(params[:id])
      @games = @category.games
      render 'games/category'
    end

  end

  def index
    @categories = GameCategory.all.order(id: :asc)
  end
end