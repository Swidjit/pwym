class RoundScoresController < ApplicationController

  def create
    if user_signed_in?
      entry = current_user.entries.where(:match_id=>params[:match_id]).first
      RoundScore.create(:score => params[:score], :entry => entry, :game_id => params[:game_id], :user=>current_user)
      #hack for now
      Match.find(params[:match_id]).increment!(:round_num)
      render :json => {:success=>:true}
    end
  end

end