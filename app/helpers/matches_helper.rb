module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
    # matches.select{|match| match.date > Date.today && match.time < Time.now}
    matches.each do |match|
      puts match.start
    end
  end

  def format_match_date(match)
    match_date = match.start
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end
end
