class MatchesController < ApplicationController

  before_filter :set_match, :only => [:show, :leave, :refresh, :check,:play]

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
    @entries = @match.entries
    if @match.status = "active"
      render 'active_entries'
    elsif @match.status = "playing"
      render 'scoreboard'
    end
  end

  def play
    @entries = @match.entries
  end

  def check
    if @match.start_time.between?(Time.now, Time.now+5.minutes)
      render 'load_match'
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

end