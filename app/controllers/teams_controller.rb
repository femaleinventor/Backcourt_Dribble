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
    @sports = Sport.all
    @teams = Team.order(:name)
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(update_team_params)
        redirect_to team_path(@team), alert: "Team updated successfully!"
    else
        redirect_to team_path(@team), alert: "Oops! Your update to #{@team.name} wasn't recorded. Try again!"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      redirect_to admin_index_path
    else
      redirect_to team_path(@team), alert: "Oops! #{@team.name} wasn't deleted. Try again!"
    end
  end

  private
    def team_params
      params.require(:team).permit(:name, :abbreviation, :nickname, :bright_color, :light_color, :dark_color, :twitter_list, :sport_id)
    end

    def update_team_params
      params.require(:team).permit(:name, :abbreviation, :nickname, :bright_color, :light_color, :dark_color, :twitter_list, :sport_id)
    end

end
