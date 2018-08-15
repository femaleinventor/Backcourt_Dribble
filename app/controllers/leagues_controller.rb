class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to admin_index_path, alert: "League created successfully!"
    else
        redirect_to admin_index_path, alert: "Oops! The league wasn't recorded. Try again!"
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    if @league.update(update_league_params)
        redirect_to league_path(@league), alert: "League updated successfully!"
    else
        redirect_to league_path(@league), alert: "Oops! Your update to #{@league.name} wasn't recorded. Try again!"
    end
  end

  def destroy
    @league = League.find(params[:id])
    if @league.destroy
      redirect_to admin_index_path
    else
      redirect_to league_path(@league), alert: "Oops! #{@league.name} wasn't deleted. Try again!"
    end
  end

  private
    def league_params
      params.permit(:name, :abbreviation, :sport_id)
    end

    def update_league_params
      params.require(:league).permit(:name, :abbreviation, :sport_id)
    end
end
