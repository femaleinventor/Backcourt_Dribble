class Tweet < ApplicationRecord
  belongs_to :twitter_user
  has_and_belongs_to_many :hashtags
end
