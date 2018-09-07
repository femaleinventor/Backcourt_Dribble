class PredictionsController < ApplicationController

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def new
    @prediction = Prediction.new
  end

  def create
    @prediction = Prediction.new(prediction_params)
    @league = @prediction.match.league
    if @prediction.save
      # Returns to matches#index page after prediction submission
      redirect_to league_matches_path(@league)
    else
        redirect_to league_matches_path(@league), danger: "You must enter both a guess and a reason to submit a prediction!"
    end
  end

  private
    def prediction_params
      params.permit(:guess, :reason, :match_id, :user_id)
    end

end
