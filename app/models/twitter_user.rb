class TwitterUser < ApplicationRecord
  has_many :tweets
end
