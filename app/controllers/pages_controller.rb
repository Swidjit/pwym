class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :brainball

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

  def crossdomain

  end

  def index
    @title = params[:page_name].titleize
    render params[:page_name]
  end

  def brainball

    render '/brainball/data'+params[:task_num].to_s
    #render :xml => choices.to_xml(skip_types: true)
  end

end
