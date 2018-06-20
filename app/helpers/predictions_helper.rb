module PredictionsHelper
  def select_team_predictions(match, team)
    match.predictions.select {|prediction| prediction.guess == team.name }
  end

  def calculate_total_predictions(match)
    match.predictions.count
  end

  def calculate_prediction_percentage(match, team)
    predictions = select_team_predictions(match, team)
    total_team_predictions = predictions.count
    if total_team_predictions > 0
      percentage_of_predictions = ((total_team_predictions) / (calculate_total_predictions(match)) * 100)
      "#{percentage_of_predictions}%"
    else
      "There are no predictions for this team yet!"
    end
  end
end
