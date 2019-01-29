class ChangeIntegerLimitinTweets < ActiveRecord::Migration[5.1]
  def change
    change_column :tweets, :tweet_id, :bigint
  end
end
