class AddStatusesCountToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :statuses_count, :integer
  end
end
