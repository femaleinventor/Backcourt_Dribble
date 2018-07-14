class MatchesController < ApplicationController
  def index
    @matches = Match.where(league_id: params[:league_id])
  end

end
