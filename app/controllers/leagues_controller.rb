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

  private
    def league_params
      params.permit(:name, :abbreviation, :sport_id)
    end
end
