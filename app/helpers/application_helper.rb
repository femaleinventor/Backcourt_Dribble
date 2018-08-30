module ApplicationHelper
  def calculate_rank(users)
    rank_array = []
    users.each do |user|
      user_rank_info = {"key" => user.calculate_points}
      rank_array << user_rank_info
    end
    rank_array
  end

  def sort_ranks(ranks_array)
    ranks_array.sort_by{|k| k["key"]}.reverse
  end
end
