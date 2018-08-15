module AdminHelper
  def format_match_date(match)
    match_date = match.start
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end
end
