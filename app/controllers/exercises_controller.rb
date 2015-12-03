class ExercisesController <  ApplicationController
  def show
    if params.has_key?(:category)
      @category = ExerciseCategory.find_by_slug(params[:category])
      puts @category
    end
    if params.has_key?(:exercise)
      @game = Exercise.find_by_slug(params[:exercise])
      @comments = @game.comment_threads.order('created_at desc')
      @new_comment = Comment.build_from(@game, current_user.id, "") if user_signed_in?
    else
      render 'games/category'
    end
  end
end