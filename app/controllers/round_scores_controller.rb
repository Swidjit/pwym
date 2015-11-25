class RoundScoresController < ApplicationController

  def create
    if user_signed_in?
      entry = current_user.entries.where(:match_id=>params[:match_id]).first
      RoundScore.create(:score => params[:score], :entry => entry, :game_id => params[:game_id], :user=>current_user, :match_id=>params[:match_id])
      entry.update_attribute(:score,entry.round_scores.sum(:score))
      match = Match.find(params[:match_id])
      render :json => {:success=>:true}
    end
  end

end