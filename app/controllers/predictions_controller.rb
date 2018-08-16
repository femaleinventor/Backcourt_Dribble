class PredictionsController < ApplicationController

  def new
    @prediction = Prediction.new
  end

  def create
    @prediction = Prediction.new(prediction_params)
    @league = @prediction.match.league
    if @prediction.save
      # Returns to matches#index page after prediction submission
      redirect_to league_matches_path(@league), alert: "Thanks for making a prediction!"
      # redirect_to "/", alert: "Thanks for making a prediction!"
    else
        redirect_to league_matches_path(@league), alert: "Oops! Your prediction wasn't recorded. Try again!"
    end
  end

  private
    def prediction_params
      params.permit(:guess, :reason, :match_id, :user_id)
    end
end
