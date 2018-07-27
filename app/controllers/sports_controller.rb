class SportsController < ApplicationController

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    if !current_user
      render :new_user_registration
    end
    @sports = Sport.all
  end

  def leaderboard
    @sport = Sport.find(params[:id])
    @predictions = @sport.predictions
    @leagues = @sport.leagues
    @nwsl = @leagues.find(2)
  end

end
