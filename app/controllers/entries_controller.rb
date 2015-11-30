class EntriesController < ApplicationController

  before_filter :set_entry, :only=>[:show, :destroy]

  def show

  end

  def create
    @entry = Entry.create(:match_id=>params[:match_id])
    @match = Match.find(params[:match_id])
    @match.increment!(:entry_count)
    if user_signed_in?
      current_user.entries << @entry
      @enrollments = current_user.entries.pluck(:match_id)
      if @match.start_time.between?(Time.now,Time.now+15.minutes)
        render 'load_match'
      end
    elsif cookies[:session_id].to_i > 0
      @entry.session_id = cookies[:session_id]
      @entry.save
    end

  end

  def destroy
    @id=@entry.id
    @match = @entry.match
    @match.decrement!(:entry_count)
    if @entry.destroy
      respond_with do |format|
        format.js {render 'destroy'}
      end
    else
      respond_with do |format|
        format.js {render 'error'}
      end
    end
  end

  private

  def set_match
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:match_id)
  end

end