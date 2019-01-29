class MatchesController < ApplicationController
  before_action :authenticate_admin
  def index
    @league_matches = Match.where(league_id: params[:league_id])
    @league = League.find(params[:league_id])
    gon.current_user = current_user
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    #Get utc offset of match in hours
    offset = get_match_offset(@match)
    if @match.save
      # Reassign match.start to match.start minus the offset in seconds because original match.start doesn't have timezone associated with object
      @match.start = @match.start - offset * 3600
      # Save that shizz - the utc time of the match based on match timezone is now saved
      @match.save!
      redirect_to admin_index_path, alert: "Match created successfully!"
    else
        redirect_to admin_index_path
    end
  end

  def show
    @match = Match.find(params[:id])
    @sports = Sport.all
    @matches = Match.order(:start)
  end

  def update
    @match = Match.find(params[:id])
    #Get utc offset of match in hours
    offset = get_match_offset(@match)
    if @match.update(update_match_params)
      # Reassign match.start to match.start minus the offset in seconds because original match.start doesn't have timezone associated with object
      @match.start = @match.start - offset * 3600
      # Save that shizz - the utc time of the match based on match timezone is now saved
      @match.save!
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
      params.require(:match).permit(:result, :channel, :start, :time_zone, :venue_id, :sport_id, :league_id, :home_team_id, :away_team_id)
    end

    def update_match_params
      params.require(:match).permit(:result, :channel, :start, :time_zone, :venue_id, :sport_id, :league_id, :home_team_id, :away_team_id)
    end

    def get_match_offset(match)
      # Gets the total offset of a match start time (utc total offset = std + utc offsets)
      offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
    end

end
