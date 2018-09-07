module ApplicationHelper
  # require "ranker"
  # def calculate_rank(users)
  #   rank_array = []
  #   users.each do |user|
  #     user_rank_info = {"key" => user.calculate_points}
  #     rank_array << user_rank_info
  #   end
  #   rank_array
  # end
  #
  # def sort_ranks(ranks_array)
  #   ranks_array.sort_by{|k| k["key"]}.reverse
  # end

  def get_unique_users(predictions)
    users = predictions.collect {|prediction| prediction.user}
    users.uniq
  end

  def sort_users_by_points(users)
    users.sort_by{|u| u.points}.reverse
  end



  # def get_rank(users)
  #   Ranker.rank(user)
  # end

end
