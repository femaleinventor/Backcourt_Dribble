module AdminHelper
  def format_match_date(match)
    match_date = match.start
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end

  def alphabetize(resources)
    resources.sort_by{|resource| resource.name}
  end
  def sort_by_date(matches)
    matches.sort_by{|match| match.start}
  end
  def convert_to_match_time_zone(match)
    Time.utc(match.start.year, match.start.month , match.start.day, match.start.hour,match.start.min).in_time_zone(match.time_zone)
  end
end
