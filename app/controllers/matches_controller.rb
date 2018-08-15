class MatchesController < ApplicationController
  def index
    @matches = Match.where(league_id: params[:league_id])
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to admin_index_path, alert: "Match created successfully!"
    else
        redirect_to admin_index_path, alert: "Oops! The match wasn't recorded. Try again!"
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  private
    def match_params
      params.permit(:channel, :start, :venue_id, :sport_id, :league_id, :home_team_id, :away_team_id)
    end

end
