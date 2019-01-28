class Tweet < ApplicationRecord
  belongs_to :twitter_user
  has_and_belongs_to_many :hashtags
  has_many :quoted_tweets, :class_name => "Tweet",
    :foreign_key => "quoted_tweet_id"
  belongs_to :quoted_tweet, :class_name => "Tweet",
    :foreign_key => "quoted_tweet_id", optional: true
end
