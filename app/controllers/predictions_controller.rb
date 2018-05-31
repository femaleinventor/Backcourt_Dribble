class PredictionsController < ApplicationController

  def new
    @prediction = Prediction.new
  end

  def create
    @prediction = Prediction.new(prediction_params)
    if @prediction.save
        redirect_to "/", alert: "Thanks for making a prediction!"
    else
        redirect_to league_matches_path, alert: "Oops! Your prediction wasn't recorded. Try again!"
    end
  end

  private
    def prediction_params
      # params.require(:prediction).permit(:guess, :reason)
      params.permit(:guess, :reason, :match_id, :user_id)
    end
end
