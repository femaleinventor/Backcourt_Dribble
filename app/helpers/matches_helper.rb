module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
    matches.select{|match| match.start.utc >= DateTime.now.utc}
  end

  def sort_matches_by_date(matches)
    #Sorts Matches By Start Date/Time
    matches.sort_by{|match| match.start }
  end

  #DOES NOT WORK
  def convert_to_local_time(match)
    match.start.to_time.localtime
  end

  def format_match_date(match)
    match.start.strftime("%m/%d/%Y at %I:%M%p")
  end

  #Unnecessary first line
  def format_local_time(start_string)
    # local_time = convert_to_local_time(match)
    start_string.strftime("%m/%d/%Y at %I:%M%p")
  end

  # This method works!
  def get_match_offset(match)
    # Gets the total offset of a match start time (utc total offset = std + utc offsets)
    offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
  end

  # This method works!
  def calculate_offset_difference(match_offset, local_offset)
    match_offset - local_offset
  end

  def adjust_local_time(match, match_offset, local_offset)
    difference = calculate_offset_difference(match_offset, local_offset)

    match_start = match.start

    match_start - difference * 3600
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
