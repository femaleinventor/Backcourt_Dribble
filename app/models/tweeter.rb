class Tweeter < ApplicationRecord
  belongs_to :sport
  validates :twitter_handle, presence: true
end
