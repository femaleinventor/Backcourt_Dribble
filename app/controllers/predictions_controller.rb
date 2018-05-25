class PredictionsController < ApplicationController

  def create
    @prediction = Prediction.new(params[:prediction])
    if @prediction.save
        redirect_to '/', alert: "Thanks for making a prediction!"
    else
        redirect_to league_matches_path, alert: "Oops! Your prediction wasn't recorded. Try again!"
    end
  end

  private
    def prediction_params
      params.require(:prediction).permit(:guess, :reason, :user_id, :match_id)
    end
end
