class ExercisesController <  ApplicationController
  def show
    if params.has_key?(:category)
      @category = ExerciseCategory.find_by_slug(params[:category])
      puts @category
    end
    if params.has_key?(:exercise)
      @game = Exercise.find_by_slug(params[:exercise])
    else
      render 'games/category'
    end
  end
end