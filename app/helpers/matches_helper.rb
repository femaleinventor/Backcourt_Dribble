module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
      matches.select{|match| match.start > DateTime.now}
  end

  def format_match_date(match)
    match_date = match.start
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end

  def sort_matches_by_date(matches)
    matches.sort_by{ |match| match.start }
  end
end
