module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
    matches.select{|match| match.start.utc >= DateTime.now.utc}
  end

  def sort_matches_by_date(matches)
    #Sorts Matches By Start Date/Time
    matches.sort_by{|match| match.start }
  end

  # Converts a utc Time object to the time zone of a match
  def convert_to_match_time_zone(match)
    Time.utc(match.start.year, match.start.month , match.start.day, match.start.hour,match.start.min).in_time_zone(match.time_zone)
  end

  # Converts a utc Time object to the time zone of the current user
  def convert_to_user_time_zone(match)
    Time.utc(match.start.year, match.start.month , match.start.day, match.start.hour,match.start.min).in_time_zone(current_user.time_zone)
  end


  def format_match_date(match)
    match.start.strftime("%m/%d/%Y at %I:%M%p")
  end


  def format_datetime_from_string(start_string)
    start_string.strftime("%m/%d/%Y at %I:%M%p")
  end

  # This method works!
  def get_match_offset(match)
    # Gets the total offset of a match start time (utc total offset = std + utc offsets)
    offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
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

  def check_for_spaces(form_input)
    form_input.match(/\s/) ? true : false
  end

  def insert_spaces(string)
    !check_for_spaces(string) ? string.scan(/.{50}|.+/).join(" ") : string
  end

end
