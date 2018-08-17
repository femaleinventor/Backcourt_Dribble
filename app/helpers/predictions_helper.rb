module PredictionsHelper
  def select_team_predictions(match, team)
    predictions = match.predictions.select {|prediction| prediction.guess == team.name }
  end

  def select_tie_predictions(match, keyword)
    predictions = match.predictions.select {|prediction| prediction.guess == keyword }
    # predictions.count
  end

  # def build_prediction_types_array(home, team, tie)
  #   array = [home, team, tie]
  # end

  def calculate_total_predictions(match)
    match.predictions.count.to_f
  end

  def calculate_team_prediction_percentage(match, guess)
    predictions = select_team_predictions(match, guess)
    total_predictions = predictions.count
    if total_predictions > 0
      percentage_of_predictions = ((total_predictions.to_f / calculate_total_predictions(match)) * 100).to_i
      format_percent(percentage_of_predictions)
    else
      "There are no predictions for this outcome yet!"
    end
  end

  def calculate_tie_prediction_percentage(match, guess)
    predictions = select_tie_predictions(match, guess)
    total_predictions = predictions.count
    if total_predictions > 0
      percentage_of_predictions = ((total_predictions.to_f / calculate_total_predictions(match)) * 100).to_i
      format_percent(percentage_of_predictions)
    else
      "There are no predictions for this outcome yet!"
    end
  end

  def format_percent(num)
    "#{num}%"
  end

  def pluralize_prediction_statement(num_predictions)
    if num_predictions > 1 || 0
      "users predict"
    else
      "user predicts"
    end
  end

end
