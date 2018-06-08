module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
    matches.select{|match| match.date > Date.today && match.time < Time.now}
  end
end
