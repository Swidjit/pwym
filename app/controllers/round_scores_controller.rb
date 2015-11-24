class RoundScoresController < ApplicationController

  def create
    if user_signed_in?
      entry = current_user.entries.where(:match_id=>params[:match_id]).first
      RoundScore.create(:score => params[:score], :entry => entry, :game_id => params[:game_id], :user=>current_user)
      #hack for now
      match = Match.find(params[:match_id])
      if(match.status == "playing")
        match.increment!(:round_num)
        match.update_attribute(:status, "scoring")
      end
      render :json => {:success=>:true}
    end
  end

end