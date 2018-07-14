module SportsHelper
  # Find each user that has made a prediction in a given sport (1 entry)
  # Add to an array for iteration and row generation
  def get_unique_users(predictions)
    users = predictions.collect {|prediction| prediction.user}
    users.uniq
  end
end
