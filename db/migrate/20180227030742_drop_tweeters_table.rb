class DropTweetersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :tweeters
  end
end
