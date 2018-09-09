module ApplicationHelper

  def get_unique_users(predictions)
    users = predictions.collect {|prediction| prediction.user}
    users.uniq
  end

  def sort_users_by_points(users)
    users.sort_by{|u| u.points}.reverse
  end

end
