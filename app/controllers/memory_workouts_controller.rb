class MemoryWorkoutsController <  ApplicationController
  def show

    if params.has_key?(:exercise)
      @game = MemoryWorkout.find_by_slug(params[:exercise])
    else
      render 'games/category'
    end
  end

  def index
    @workouts = MemoryWorkout.all
  end
end