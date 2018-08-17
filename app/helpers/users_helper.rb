module UsersHelper
  def find_winner(match, home_team, away_team)
    if match.result == home_team
      return home_team
    elsif match.result == away_team
      return away_team
    else
      return "tie"
    end
  end
end
