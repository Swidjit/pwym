class PagesController < ApplicationController

  def home
    @upcoming_matches = Match.where('start_time > ?',Time.now).order(start_time: :asc).limit(20)
    @enrollments = current_user.entries.pluck(:match_id)
    puts @enrollments
  end

  def sitemap

  end

end
