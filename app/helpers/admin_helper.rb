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
end
