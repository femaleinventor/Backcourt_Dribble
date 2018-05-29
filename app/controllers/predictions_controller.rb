class PredictionsController < ApplicationController

  def new
    @prediction = Prediction.new
  end

  def create
    @prediction = Prediction.new(prediction_params)
    if @prediction.save
        redirect_to '/', alert: "Thanks for making a prediction!"
        puts "Your user id is #{current_user.id}"
        puts "The match id is #{@prediction.match_id}"
        puts "The prediction id is #{@prediction.id}"

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
