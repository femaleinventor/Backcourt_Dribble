module MatchesHelper
  def find_future_matches(matches)
    #Returns an array of future matches
    matches.select{|match| match.start >= DateTime.now.change(:offset => "+0000")}
  end

  def sort_matches_by_date(matches)
    #Sorts Matches By Start Date/Time
    matches.sort_by{|match| match.start }
  end

  def convert_to_local_time(match)
    match.start.to_time.localtime
  end

  def format_match_date(match)
    match.start.strftime("%m/%d/%Y at %I:%M%p")
  end

  # def get_offset_of_venue(match)
  #   seconds = ActiveSupport::TimeZone[match.venue.time_zone].utc_offset
  #   seconds / 60 / 60
  # end

  # def add_offset_to_match_start(match)
  #   match.start.change(:offset => get_offset_of_venue(match))
  # end

  def format_local_time(match)
    local_time = convert_to_local_time(match)
    local_time.strftime("%m/%d/%Y at %I:%M%p")
  end

  def adjust_match_start(match)
    year = match.start.year
    month = match.start.month
    day = match.start.day
    hour = match.start.hour
    min = match.start.min

    tz = TZInfo::Timezone.get(match.time_zone)
    local = tz.utc_to_local(Time.local(year,month,day,hour,min,0))

  end

  def get_match_offset(match)
    # Gets the total offset of a match start time (utc total offset = std + utc offsets)
    offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
  end

  def calculate_offset_difference(match_offset, local_offset)
    match_offset - local_offset
  end

  def adjust_local_time(match, match_offset, local_offset)
    year = match.start.year
    month = match.start.month
    day = match.start.day
    hour = match.start.hour
    min = match.start.min

    difference = calculate_offset_difference(match_offset, local_offset)
    match_start = match.start

    if difference < 0
      match.start - difference * 3600
    else
      match.start + difference * 3600
    end
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



  # When creating a new match
    #Update db and admin forms to:
      # Add TimeZone dropdown to Match
      # Remove from Venue
      # Get offset from TimeZone dropdown, based on location AND date of match

    #When displaying the date of a match
      #Find the timezone of the match and get the local time of it?
      #Find the users timezone and display what the match would be in their time

      #Date and Time



end
