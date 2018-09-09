class SportsController < ApplicationController

  def index
    @sports = Sport.all
    @leagues = League.all
  end

  def leaderboard
    @sports = Sport.all
    @sport = Sport.find(params[:id])
    @predictions = @sport.predictions
    @leagues = @sport.leagues
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
    @sports = Sport.all
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(update_sport_params)
        redirect_to sport_path(@sport), alert: "Sport updated successfully!"
    else
        redirect_to sport_path(@sport), alert: "Oops! Your update to #{@sport.name} wasn't recorded. Try again!"
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    if @sport.destroy
      redirect_to admin_index_path
    else
      redirect_to sport_path(@sport), alert: "Oops! #{@sport.name} wasn't deleted. Try again!"
    end
  end

  private
    def sport_params
      params.require(:sport).permit(:name, :image_url, :sound_link)
      # params.permit(:name, :image_url, :sound_link)
    end

    def update_sport_params
      params.require(:sport).permit(:name, :image_url, :sound_link)
    end
end
