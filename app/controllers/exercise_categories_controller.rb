class ExerciseCategoriesController <  ApplicationController
  def index
    @categories = ExerciseCategory.all
    puts @categories
  end
  def show
    @category = ExerciseCategory.find_by_slug(params[:category])
    @games = @category.exercises
  end
end