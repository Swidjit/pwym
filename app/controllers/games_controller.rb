class GamesController <  ApplicationController
  def show
    if params.has_key?(:category)
      puts params[:category]
      if params[:category]=='online-brain-games'
        redirect_to :controller => :game_categories, :action => :index
      end
      @category = GameCategory.find_by_slug(params[:category])
      puts @category
    end
    if params.has_key?(:game)
      @game = Game.find_by_slug(params[:game])
      @comments = @game.comment_threads.order('created_at desc')
      @new_comment = Comment.build_from(@game, current_user.id, "") if user_signed_in?
    else
      render 'games/category'
    end
  end
end