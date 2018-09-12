class MatchesController < ApplicationController
  def index
    @league_matches = Match.where(league_id: params[:league_id])
    @league = League.find(params[:league_id])
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
    @sports = Sport.all
    @matches = Match.order(:start)
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(update_match_params)
        redirect_to match_path(@match), alert: "Match updated successfully!"
    else
        redirect_to match_path(@match), alert: "Oops! Your update to Match:#{@match.id} wasn't recorded. Try again!"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if @match.destroy
      redirect_to admin_index_path
    else
      redirect_to match_path(@match), alert: "Oops! The match with ID #{@match.id} wasn't deleted. Try again!"
    end
  end

  private
    def match_params
      params.require(:match).permit(:result, :channel, :start, :venue_id, :sport_id, :league_id, :home_team_id, :away_team_id)
    end

    def update_match_params
      params.require(:match).permit(:result, :channel, :start, :venue_id, :sport_id, :league_id, :home_team_id, :away_team_id)
    end

end
