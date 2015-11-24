class PagesController < ApplicationController

  def home
    @upcoming_matches = Match.where('start_time > ?',Time.now).order(start_time: :asc).limit(20)
    if user_signed_in?

      @enrollments = current_user.entries.pluck(:match_id)
    else
      @enrollments = Entry.where(:session_id=>cookies[:session_id]).pluck(:match_id)
    end

  end

  def sitemap

  end

end
