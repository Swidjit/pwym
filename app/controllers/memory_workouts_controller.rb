class MemoryWorkoutsController <  ApplicationController
  def show

    if params.has_key?(:exercise)
      @game = MemoryWorkout.find_by_slug(params[:exercise])
      @comments = @game.comment_threads.order('created_at desc')
      @new_comment = Comment.build_from(@game, current_user.id, "") if user_signed_in?
    else
      render 'games/category'
    end
  end

  def index
    @workouts = MemoryWorkout.all
  end
end