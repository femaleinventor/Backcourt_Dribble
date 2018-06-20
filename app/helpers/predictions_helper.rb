module PredictionsHelper
  def select_team_predictions(match, team)
    match.predictions.select {|prediction| prediction.guess == team.name }
  end

  def select_tie_predictions(match, keyword)
    match.predictions.select {|prediction| prediction.guess == keyword }
  end

  def build_prediction_types_array(home, team, tie)
    array = [home, team, tie]
  end

  def calculate_total_predictions(match)
    match.predictions.count
  end

  def calculate_prediction_percentage(match, guess)
    predictions = select_team_predictions(match, guess)
    total_predictions = predictions.count
    if total_predictions > 0
      percentage_of_predictions = ((total_predictions) / (calculate_total_predictions(match)) * 100)
      "#{percentage_of_predictions}%"
    else
      "There are no predictions for this outcome yet!"
    end
  end
end
