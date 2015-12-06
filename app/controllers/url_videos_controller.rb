class UrlVideosController < ApplicationController
  def create
    item = UrlVideo.create(item_params)
    current_user.url_videos << item

  end

  def new
    @video = UrlVideo.new
  end

  def item_params
    params.require(:website).permit(:topic_list,:url, :title, :description)
  end

  def index
    @videos = UrlVideo.all
    puts @videos
  end


  def scrape
    @video_url = params[:url]
    @video_id = params[:url].split('/')[-1].split('=')[-1]
    if @video_url =~ /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
      @video_type = "youtube"
    elsif @video_url.include? 'vimeo'
      @video_type = 'vimeo'
    elsif @video_url.include? 'vine.co'
      @video_type = 'vine'
    end
    puts @video_type
    puts @video_id
    if params[:url]
      @page = MetaInspector.new(params[:url],
                                :warn_level => :store,
                                :connection_timeout => 5, :read_timeout => 5,
                                :headers => { 'User-Agent' => user_agent, 'Accept-Encoding' => 'identity' })

      if @page.response.nil?

      else
        #@page.title = @page.title.gsub("'","")
        #@page.description = @page.description.gsub("'","")

        puts @page
        render 'scrapes/scrape_with_youtube' if @video_type == 'youtube'
        render 'scrapes/scrape_with_vimeo' if @video_type == 'vimeo'
        render 'scrapes/scrape_with_vine' if @video_type == 'vine'
      end
    else

      render 'scrapes/scrape_failed'
    end
  end

  private

  def user_agent
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"
  end
end
