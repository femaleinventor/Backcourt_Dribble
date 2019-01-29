class CreateHashtagsTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags_tweets do |t|
      t.references :hashtag, foreign_key: true
      t.references :tweet, foreign_key: true
    end
  end
end
