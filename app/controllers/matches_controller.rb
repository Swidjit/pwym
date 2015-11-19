class MatchesController < ApplicationController

  before_filter :set_match, :only => [:show, :leave, :refresh, :check, :check_into, :play, :load_game]
  respond_to :js

  def show

  end

  def create

  end

  def leave
    if user_signed_in?
      @match.entries.where(:user=>current_user).delete_all
      @match.decrement!(:entry_count)
      @enrollments = current_user.entries.pluck(:match_id)
    else
      @match.entries.where(:session_id=>cookies[:session_id]).delete_all
      @match.decrement!(:entry_count)
    end
    render 'entries/create'
  end

  def refresh
    puts 'refreshing'
    @entries = @match.entries

    if @match.status == "active"
      render 'active_entries'
    elsif @match.status == "countdown"
      render :json => {:match_status=>:countdown}
    elsif @match.status == "playing"
      render 'scoreboard'
    end
  end

  def play
    @entries = @match.entries
    if user_signed_in?
      @enrollment_status = Entry.where(:user=>current_user, :match=> @match).first.status
    end
  end

  def check
    if @match.status == 'active'
      render 'load_match'
    end
  end

  def check_into
    if @match.status == "active"
      if user_signed_in?
        @entry = Entry.where(:user=>current_user, :match=> @match).first
        if @entry.update_attribute(:status, 'checked_in')

        else
          render 'shared/error'
        end
      end
    end
  end

  def load_game
    @game = @match.games.offset(@match.round_num-1).first
    if @match.round_num > 3
      render 'match_complete'
    end
    #@match.increment!(:round_num)
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

end