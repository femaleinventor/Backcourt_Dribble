class SportsController < ApplicationController

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    if !current_user
      render :new_user_registration
    end
    @sports = Sport.all
    @leagues = League.all
  end

  def leaderboard
    @sport = Sport.find(params[:id])
    @predictions = @sport.predictions
    @leagues = @sport.leagues
    @nwsl = @leagues.find(2)
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to admin_index_path, alert: "Sport created successfully!"
    else
        redirect_to admin_index_path, alert: "Oops! Your prediction wasn't recorded. Try again!"
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  private
    def sport_params
      params.permit(:name, :image_url)
    end
end
