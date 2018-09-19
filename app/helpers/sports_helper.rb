module SportsHelper
  # Find each user that has made a prediction in a given sport (1 entry)
  # Add to an array for iteration and row generation
  def get_unique_users(predictions)
    users = predictions.collect {|prediction| prediction.user}
    users.uniq
  end


  def find_future_sport_matches(matches)
    #Returns an array of future matches
    matches.select{|match| match.start != nil && match.start >= DateTime.now.change(:offset => "+0000")}
  end

  def create_inactive_leagues_array(array1, array2)
    inactive_leagues = array2 - array1
  end



end
