class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_index_path, alert: "Team created successfully!"
    else
        redirect_to admin_index_path, alert: "Oops! The team wasn't recorded. Try again!"
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private
    def team_params
      params.permit(:name, :abbreviation, :sport_id, :bright_color, :light_color, :dark_color, :twitter_list)
    end

end
