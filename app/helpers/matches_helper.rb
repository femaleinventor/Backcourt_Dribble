module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
      matches.select{|match| match.start > DateTime.now}
  end

  def format_match_date(match)
    match_date = match.start
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end

  def format_match_date_english(match)
     date = match.start.to_date.strftime("%B #{match.start.to_date.day.ordinalize}, %Y")
     time = match.start.strftime("%I:%M%p")
     "#{date} at #{time}"
  end

  def get_team_abbr(prediction)
   home_team = Team.find(prediction.match.home_team_id)
   away_team = Team.find(prediction.match.away_team_id)
    if prediction.guess == home_team.name
      home_team.abbreviation
    elsif prediction.guess == away_team.name
      away_team.abbreviation
    else
      "Tie"
    end
  end

  # def get_local_zone(match)
  #   match_date = match.start
  #   match_date.in_time_zone
  # end

  def sort_matches_by_date(matches)
    matches.sort_by{ |match| match.start }
  end
end
