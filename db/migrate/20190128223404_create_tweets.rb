class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :tweet_id, limit: 8
      t.string :tweet_id_str
      t.datetime :created
      t.string :full_text
      t.integer :favorite_count, limit: 8
      t.integer :retweet_count, limit: 8
      t.string :source
      t.references :twitter_user, foreign_key: true
      t.integer :quoted_tweet_id
      t.integer :statuses_count, limit: 8

      t.timestamps
    end
  end
end
