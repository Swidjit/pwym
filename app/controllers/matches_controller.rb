class MatchesController < ApplicationController

  before_filter :set_match, :except => [:check]
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
    @entries = @match.entries

    if @match.status == "active"
      render 'active_entries'
    elsif @match.status == "countdown"
      render :json => {:match_status=>:countdown, :match_time => (@match.start_time-Time.now)}
    elsif @match.status == "playing"
      render :json => {:match_status=>:playing}
    end
  end

  def refresh_scoreboard
    @entries = @match.entries.order(score: :desc)

  end

  def play
    @entries = @match.entries
    if user_signed_in?
      @enrollment_status = Entry.where(:user=>current_user, :match=> @match).first.status
    end
  end

  def check
    @match = Match.find(params[:match_id])
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

    if(@match.status == "scoring")
      @match.update_attribute(:status, "playing")
    end
    @game = @match.games.offset(params[:round_num].to_i-1).first
    if @match.status == "complete"
      render 'match_complete'
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

end